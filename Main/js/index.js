document.addEventListener('DOMContentLoaded', function () {
  // --- MODAL FORM LOADING ---
  const mainContent = document.getElementById('main-content');
  const addUserUrl = mainContent.dataset.addUserUrl;

  // Add User Modal
  const addUserModal = document.getElementById('addUserModal');
  if (addUserModal) {
    const modalBody = document.getElementById('addUserModalBody');
    addUserModal.addEventListener('show.bs.modal', function () {
      fetch(addUserUrl)
        .then(res => res.ok ? res.text() : Promise.reject())
        .then(html => modalBody.innerHTML = html)
        .catch(() => modalBody.innerHTML = '<p class="text-danger">Error loading form. Please try again.</p>');
    });
  }

  // Edit User Modal
  const editUserModal = document.getElementById('editUserModal');
  if (editUserModal) {
    editUserModal.addEventListener('show.bs.modal', function (event) {
      const button = event.relatedTarget;
      if (!button) return;
      const userId = button.getAttribute('data-user-id');
      const modalBody = document.getElementById('editUserModalBody');
      // Note: This URL is hardcoded. This is usually fine.
      fetch(`/edit-user-form/${userId}`)
        .then(response => response.text())
        .then(html => modalBody.innerHTML = html)
        .catch(() => modalBody.innerHTML = '<p class="text-danger">Error loading form.</p>');
    });
  }

  // --- TABLE PAGINATION AND FILTERING ---
  const entriesSelect = document.getElementById('entries');
  const tableBody = document.getElementById('userTableBody');
  const pagination = document.getElementById('pagination');
  const searchInput = document.getElementById('searchUsername');
  const allRows = Array.from(tableBody.querySelectorAll('tr'));
  let rowsPerPage = 10;
  let currentPage = 1;

  function applyFiltersAndPagination() {
    const keyword = searchInput.value.toLowerCase();
    
    const filteredRows = allRows.filter(row => {
      const username = row.cells[1].textContent.toLowerCase();
      return username.includes(keyword);
    });

    const totalPages = rowsPerPage === 'all' ? 1 : Math.ceil(filteredRows.length / rowsPerPage);
    currentPage = Math.min(currentPage, totalPages) || 1;
    
    const start = (currentPage - 1) * rowsPerPage;
    const end = start + rowsPerPage;

    // First, hide all original rows
    allRows.forEach(row => row.style.display = 'none');
    
    // Then, show only the rows for the current page
    const rowsToShow = rowsPerPage === 'all' ? filteredRows : filteredRows.slice(start, end);
    rowsToShow.forEach(row => row.style.display = '');

    renderPagination(currentPage, totalPages);
  }

  function renderPagination(currentPage, totalPages) {
      pagination.innerHTML = '';
      if (rowsPerPage === 'all' || totalPages <= 1) return;
      
      const createPageItem = (text, page, isDisabled = false, isActive = false) => {
          const li = document.createElement('li');
          li.className = `page-item ${isDisabled ? 'disabled' : ''} ${isActive ? 'active' : ''}`;
          const a = document.createElement('a');
          a.className = 'page-link';
          a.href = '#';
          a.innerHTML = text;
          if (!isDisabled) {
              a.addEventListener('click', (e) => {
                  e.preventDefault();
                  showPage(page);
              });
          }
          li.appendChild(a);
          return li;
      };

      const showPage = (page) => {
        currentPage = page;
        applyFiltersAndPagination();
      };

      pagination.appendChild(createPageItem('&laquo;', 1, currentPage === 1));
      pagination.appendChild(createPageItem('&lt;', currentPage - 1, currentPage === 1));

      // Simplified page number logic for brevity
      for (let i = 1; i <= totalPages; i++) {
          if (i === currentPage || (i >= currentPage - 2 && i <= currentPage + 2)) {
              pagination.appendChild(createPageItem(i, i, false, i === currentPage));
          }
      }

      pagination.appendChild(createPageItem('&gt;', currentPage + 1, currentPage === totalPages));
      pagination.appendChild(createPageItem('&raquo;', totalPages, currentPage === totalPages));
  }

  entriesSelect.addEventListener('change', function () {
    rowsPerPage = this.value === 'all' ? 'all' : parseInt(this.value);
    currentPage = 1;
    applyFiltersAndPagination();
  });

  searchInput.addEventListener('input', function() {
    currentPage = 1;
    applyFiltersAndPagination();
  });

  // Initial load
  rowsPerPage = entriesSelect.value === 'all' ? 'all' : parseInt(entriesSelect.value);
  applyFiltersAndPagination();
});
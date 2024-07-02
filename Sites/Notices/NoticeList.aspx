<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <link rel="stylesheet" href="/Resources/assets/css/plugins/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="/Resources/assets/css/style.css">
    
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        .row {
            width: 100%;
            margin-left: 2px;
        }

        .d-flex {
            display: flex;
            align-items: center;
        }

        .form-control-sm {
            height: 30px;
            padding: 5px 10px;
            font-size: 12px;
            line-height: 1.5;
            border-radius: 3px;
        }

        .mr-1 {
            margin-right: 10px;
        }

        .mr-2 {
            margin-right: 20px;
        }

        .mr-3 {
            margin-left: 65rem;     
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 12px;
            line-height: 1.5;
            border-radius: 3px;
        }

        .pagination {
            display: inline-block;
            padding: 0px;
            margin-left: auto;
        }

        .pagination a {
            color: blue;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
        }

        .pagination a.active {
            background-color: blue;
            color: white;
            border: 1px solid #4CAF50;
        }

        .pagination a:hover:not(.active) {
            background-color: #ddd;
        }

        .table-responsive {
            position: relative;
        }

        .pagination-container {
            display: flex;
            justify-content: flex-end;
        }
        .badge-success {
  background-color: #2ecc71; /* green */
  color: #fff;
}

.badge-danger {
  background-color: #e74c3c; /* red */
  color: #fff;
}
    </style>
</head>
<body>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active text-uppercase" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Notice</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="d-flex flex-row">
                                    <div class="mr-1">
                                        <label for="showEntries">Show </label>
                                        <select id="showEntries" class="form-control form-control-sm">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        <label for="showEntries"> entries</label>
                                    </div>
                                    <div class="mr-2">
                                        <input type="search" id="search-input" class="form-control form-control-sm" placeholder="Search...">
                                    </div>
                                </div>
                                <div class="mr-3">
                                    <a href="/Sites/Notices/NoticeAddModify.aspx">
                                        <button id="open-popup" class="btn btn-primary">Add Customer</button> 
                                    </a>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table id="report-table" class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>S.N</th>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Image</th>
                                            <th>File</th>
                                            <th>Date</th>
                                            <th>Is Event</th>
                                            <th>Is PopUp</th>
                                            <th>Status</th>
                                            <th>Options</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table-body">
                                      
                                    </tbody>
                                </table>
                                <div class="pagination-container">
                                    <div class="pagination">
                                        <a href="#" class="prev ${currentPage === 1 ? 'disabled' : ''}">Previous</a>
                                        <a href="#" class="next ${(currentPage * rowsPerPage) >= tableData.length ? 'disabled' : ''}">Next</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>   
            </div>
        </div>
    </div>

</body>
<script>
    let tableData = [
        { SN: 1, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 2, Title: "Ipsum", Description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "In Active" },
        { SN: 3, Title: "Ipsum", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "In Active" },
        { SN: 4, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 5, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 6, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 7, Title: "Ipsum", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 8, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 9, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 10, Title: "Ipsum", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 11, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 12, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 13, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 14, Title: "Ipsum", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 15, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 15, Title: "Ipsum", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 16, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 17, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 18, Title: "Ipsum", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 19, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 20, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 21, Title: "Hari", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 22, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 23, Title: "Shyam", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 24, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 25, Title: "Ramesh", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 26, Title: "Kong", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 27, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 28, Title: "Bald", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 29, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 30, Title: "Lion", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        { SN: 31, Title: "Lorem", Description: "Build Website", Image: "", File: "Wrd.Pdf", Date: "2019-07-29", IsEvent: "Yes", IsPopUp: "Yes", Status: "Active" },
        
    ];

    let rowsPerPage = 10;
    let currentPage = 1;

    function renderTable() {
        let tableBody = document.getElementById("table-body");
        tableBody.innerHTML = "";

        let startIndex = (currentPage - 1) * rowsPerPage;
        let endIndex = startIndex + rowsPerPage;

        for (let i = startIndex; i < endIndex && i < tableData.length; i++) {
            let row = tableData[i];
            let tableRow = document.createElement("tr");
            tableRow.innerHTML = `
                <td>${row.SN}</td>
                <td>${row.Title}</td>
                <td>${row.Description}</td>
                <td><img src="${row.Image}" alt="Image"></td>
                <td><span class="badge badge-primary inline-block">${row.File}</span></td>
                <td>${row.Date}</td>
                <td>${row.IsEvent}</td>
                <td>${row.IsPopUp}</td>
               <td><span class="badge badge-${row.Status === 'Active' ? 'success' : 'danger'} inline-block">${row.Status}</span></td>
                <td>
                    <a href="#" class="btn btn-info btn-sm"><i class="feather icon-edit"></i>&nbsp;Edit </a>
                    <a href="#" class="btn btn-danger btn-sm"><i class="feather icon-trash-2"></i>&nbsp;Delete </a>
                </td>
            `;
            tableBody.appendChild(tableRow);
        }
    }

    document.getElementById("showEntries").addEventListener("change", function () {
        rowsPerPage = parseInt(this.value);
        currentPage = 1;
        renderTable();
    });

    renderTable();

   
    document.getElementById("search-input").addEventListener("input", function () {
        let searchTerm = this.value.toLowerCase();
        let filteredData = tableData.filter(function (row) {
            return (
                row.Title.toLowerCase().includes(searchTerm) ||
                row.Description.toLowerCase().includes(searchTerm) ||
                row.File.toLowerCase().includes(searchTerm) ||
                row.Date.toLowerCase().includes(searchTerm) ||
                row.IsEvent.toLowerCase().includes(searchTerm) ||
                row.IsPopUp.toLowerCase().includes(searchTerm) ||
                row.Status.toLowerCase().includes(searchTerm)
            );
        });
        renderTable(filteredData);
    });

    function renderTable(data = tableData) {
        let tableBody = document.getElementById("table-body");
        tableBody.innerHTML = "";

        let startIndex = (currentPage - 1) * rowsPerPage;
        let endIndex = startIndex + rowsPerPage;

        for (let i = startIndex; i < endIndex && i < data.length; i++) {
            let row = data[i];
            let tableRow = document.createElement("tr");
            tableRow.innerHTML = `
            <td>${row.SN}</td>
            <td>${row.Title}</td>
            <td>${row.Description}</td>
            <td><img src="${row.Image}" alt="Image"></td>
            <td><span class="badge badge-primary inline-block">${row.File}</span></td>
            <td>${row.Date}</td>
            <td>${row.IsEvent}</td>
            <td>${row.IsPopUp}</td>
           <td><span class="badge badge-${row.Status === 'Active' ? 'success' : 'danger'} inline-block">${row.Status}</span></td>
            <td>
                <a href="#" class="btn btn-info btn-sm"><i class="feather icon-edit"></i>&nbsp;Edit </a>
                <a href="#" class="btn btn-danger btn-sm"><i class="feather icon-trash-2"></i>&nbsp;Delete </a>
            </td>
        `;
            tableBody.appendChild(tableRow);
        }
    }
    document.querySelector('.next').addEventListener('click', function () {
        if (currentPage * rowsPerPage < tableData.length) {
            currentPage++;
            renderTable();
        }
    });

    document.querySelector('.prev').addEventListener('click', function () {
        if (currentPage > 1) {
            currentPage--;
            renderTable();
        }
    });

   
        // File and image upload handling
        const fileInput = document.getElementById('file');
        const imageInput = document.getElementById('image');
        const uploadArea = document.querySelector('.upload-area');
        const uploadedImage = document.querySelector('.uploaded-image');

        imageInput.addEventListener('change', (event) => {
            const file = event.target.files[0];
        if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
            uploadedImage.src = e.target.result;
                };
        reader.readAsDataURL(file);
            } else {
            uploadedImage.src = '';
            }
        });

        uploadArea.addEventListener('dragover', (event) => {
            event.preventDefault();
        uploadArea.style.backgroundColor = '#e0e0e0';
        });

        uploadArea.addEventListener('dragleave', (event) => {
            event.preventDefault();
        uploadArea.style.backgroundColor = 'transparent';
        });

        uploadArea.addEventListener('drop', (event) => {
            event.preventDefault();
        uploadArea.style.backgroundColor = 'transparent';
        const file = event.dataTransfer.files[0];
        if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
            uploadedImage.src = e.target.result;
                };
        reader.readAsDataURL(file);
            }
        });

        // Form validation
        const form = document.getElementById('form1');
        const title = document.getElementById('Title');
        const description = document.querySelector('.textarea');
        const date = document.querySelector('.date');

        form.addEventListener('submit', (event) => {
            event.preventDefault();

        if (title.value.trim() === '') {
            title.classList.add('is-invalid');
        return;
            }

        if (description.innerHTML.trim() === '') {
            description.classList.add('is-invalid');
        return;
            }

        if (date.value.trim() === '') {
            date.classList.add('is-invalid');
        return;
            }

        form.submit();
        });

        title.addEventListener('input', () => {
            title.classList.remove('is-invalid');
        });

        description.addEventListener('input', () => {
            description.classList.remove('is-invalid');
        });

        date.addEventListener('input', () => {
            date.classList.remove('is-invalid');
        });

        // Ensure the text area is focused when toolbar buttons are clicked
        document.querySelectorAll('.toolbar button').forEach(button => {
            button.addEventListener('click', () => {
                document.querySelector('.textarea').focus();
            });
        });

    
</script>
        <script src="/Resources/assets/js/vendor-all.min.js"></script>
<script src="/Resources/assets/js/plugins/bootstrap.min.js"></script>
<script src="/Resources/assets/js/ripple.js"></script>
<script src="/Resources/assets/js/pcoded.min.js"></script>
<script src="/Resources/assets/js/plugins/jquery.mask.min.js"></script>
<script src="/Resources/assets/js/pages/form-masking-custom.js"></script>
</html>
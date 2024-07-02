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
        background-color: #2ecc71; 
        color: #fff;
        }

        .badge-danger {
        background-color: #e74c3c; 
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
                            <a class="nav-link active text-uppercase" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Download</a>
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
                                        <button id="open-popup" class="btn btn-primary">Add DownloadGroup</button> 
                                    </a>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table id="report-table" class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>I.D</th>
                                            <th>Description</th>
                                            <th>File Name</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th>Download Number</th>
                                            <th>Menu ID</th>
                                            <th>Options</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table-body">
                                      
                                    </tbody>
                                </table>
                                <div class="pagination-container">
                                    <div class="pagination">
                                        <a href="#" class="prev">Previous</a>
                                        <a href="#" class="next">Next</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>   
            </div>
        </div>
    </div>
    
 <script>
     const tableData = [
         { SN: 1, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 2, Description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", File: "Wrd.Pdf", Date: "2019-07-29", Status: "In Active" },
         { SN: 3, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "In Active" },
         { SN: 4, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 5, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 6, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 7, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 8, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 9, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 10, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 11, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 12, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 13, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 14, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 15, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 16, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 17, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 18, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 19, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" },
         { SN: 20, Description: "Build Website", File: "Wrd.Pdf", Date: "2019-07-29", Status: "Active" }
     ];

     let rowsPerPage = 10;
     let currentPage = 1;

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
                    <td>${row.Description}</td>
                    <td>${row.File}</td>
                    <td>${row.Date}</td>
                    <td><span class="badge badge-${row.Status === 'Active' ? 'success' : 'danger'} inline-block">${row.Status}</span></td>
                    <td>${Math.floor(Math.random() * 100)}</td>
                    <td>${i + 1}</td>
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

     document.getElementById("search-input").addEventListener("input", function () {
         let searchTerm = this.value.toLowerCase();
         let filteredData = tableData.filter(function (row) {
             return (
                 row.SN.toString().toLowerCase().includes(searchTerm) ||
                 row.Description.toLowerCase().includes(searchTerm) ||
                 row.File.toLowerCase().includes(searchTerm) ||
                 row.Date.toLowerCase().includes(searchTerm) ||
                 row.Status.toLowerCase().includes(searchTerm)
             );
         });
         renderTable(filteredData);
     });

     document.querySelector('.next').addEventListener('click', function (event) {
         event.preventDefault();
         if ((currentPage * rowsPerPage) < tableData.length) {
             currentPage++;
             renderTable();
         }
     });

     document.querySelector('.prev').addEventListener('click', function (event) {
         event.preventDefault();
         if (currentPage > 1) {
             currentPage--;
             renderTable();
         }
     });

     renderTable();
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
        <script src="/Resources/assets/js/vendor-all.min.js"></script>
<script src="/Resources/assets/js/plugins/bootstrap.min.js"></script>
<script src="/Resources/assets/js/ripple.js"></script>
<script src="/Resources/assets/js/pcoded.min.js"></script>
<script src="/Resources/assets/js/plugins/jquery.mask.min.js"></script>
<script src="/Resources/assets/js/pages/form-masking-custom.js"></script>
</html>
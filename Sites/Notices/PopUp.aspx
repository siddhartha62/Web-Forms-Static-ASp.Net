<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notice Add/Modify</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #2596be;
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 3px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
        }

        .form-control {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
        }

        .form-check {
            margin-bottom: 10px;
        }

        .form-check-input {
            margin-right: 10px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #3e8e41;
        }

        .invalid-feedback {
            color: #dc3545;
            font-size: 14px;
            margin-top: 5px;
        }

        .is-invalid {
            border-color: #dc3545;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .upload-area {
            padding: 20px;
            border: 1px dashed #ccc;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .uploaded-image {
            width: 100%;
            max-height: 150px;
            object-fit: cover;
            border-radius: 5px;
            margin-top: 10px;
        }

        .row {
            margin-bottom: 20px;
        }

        .toolbar {
            display: flex;
            justify-content: space-between;
            border: 1px solid #ccc;
            border-bottom: none;
            padding: 5px;
            background-color: #f9f9f9;
        }

        .toolbar button {
            background: none;
            border: none;
            cursor: pointer;
        }

        .textarea-container {
            border: 1px solid #ccc;
        }

        .textarea {
            width: 100%;
            height: 200px;
            border: none;
            padding: 10px;
            box-sizing: border-box;
        }

        .col {
            display: flex;
            gap: 10px;
        }

        .form-check-input {
            box-shadow: 3px 2px 5px rgba(0, 0, 0, 0.5);
        }

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
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

th {
  background-color: #f0f0f0;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
.add-btn,.delete-btn {
  background-color: #4CAF50;
  color: #fff;
  border: none;
  padding: 5px 10px;
  font-size: 12px;
  cursor: pointer;
}

.add-btn:hover,.delete-btn:hover {
  background-color: #3e8e41;
}

.delete-btn {
  background-color: #ff0000;
}

.delete-btn:hover {
  background-color: #cc0000;
}
    </style>
</head>
<body>
    <div id="noticeFormModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="noticeFormModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="noticeFormModalLabel">Notice Add/Modify</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <label for="Title" class="form-label">Title</label>
                            <input type="text" class="form-control" id="Title" placeholder="Enter Your Title Here" required>
                            <div class="invalid-feedback">This field is required.</div>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1" class="form-label">Description</label>
                            <div class="toolbar">
                                <button type="button" onclick="document.execCommand('bold', false, '')"><b>B</b></button>
                                <button type="button" onclick="document.execCommand('italic', false, '')"><i>I</i></button>
                                <button type="button" onclick="document.execCommand('underline', false, '')"><u>U</u></button>
                                <button type="button" onclick="document.execCommand('justifyLeft', false, '')">Left</button>
                                <button type="button" onclick="document.execCommand('justifyCenter', false, '')">Center</button>
                                <button type="button" onclick="document.execCommand('justifyRight', false, '')">Right</button>
                                <button type="button" onclick="document.execCommand('undo', false, '')">Undo</button>
                                <button type="button" onclick="document.execCommand('redo', false, '')">Redo</button>
                            </div>
                            <div class="textarea-container">
                                <div class="textarea" contenteditable="true"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="date" class="form-label">Date</label>
                            <input type="text" class="form-control date" data-mask="99/99/9999" autocomplete="off" maxlength="10">
                            <div class="invalid-feedback">This field is required.</div>
                        </div>
                        <div class="form-group">
                            <label for="file" class="form-label">Upload File</label>
                            <input type="file" class="form-control" id="file" accept="*/*" required>
                            <div class="invalid-feedback">This field is required.</div>
                        </div>
                        <div class="form-group">
                            <label for="image" class="form-label">Upload Image</label>
                            <div class="file-upload">
                                <input type="file" name="image" id="image" accept="image/*">
                                <div class="upload-area">
                                    <p>Drag and drop or click to upload</p>
                                    <img src="" alt="Uploaded Image" class="uploaded-image">
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="IsEvent">
                                <label class="form-check-label" for="IsEvent">Is Event</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="IsPopUp">
                                <label class="form-check-label" for="IsPopUp">Is PopUp</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="Status" checked>
                                <label class="form-check-label" for="Status">Status</label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" style="background-color: #2596be">Submit</button>
                    </form>
                </div>
                
            </div>
        </div>
    </div>
    
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
                                      <button id="addCustomerButton" class="btn btn-primary">Add Customer</button>       
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
                                   <tbody>
                                        <tr>
                                          <td>1</td>
                                          <td>Lorem</td>
                                          <td>Build Website</td>
                                          <td></td>
                                          <td>Wrd.Pdf</td>
                                          <td>2019-07-29</td>
                                          <td>Yes</td>
                                          <td>Yes</td>
                                          <td>Active</td>
                                          <td>
                                            <button class="add-btn">Add</button>
                                            <button class="delete-btn">Delete</button>
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Ipsum</td>
                                            <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>
                                            <td></td>
                                            <td>Wrd.Pdf</td>
                                            <td>2019-07-29</td>
                                            <td>Yes</td>
                                            <td>Yes</td>
                                            <td>In Active</td>
                                        </tr>


  
  </tbody>
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

        // Trigger the modal when the "Add Customer" button is clicked
        document.getElementById('addCustomerButton').addEventListener('click', function () {
            $('#noticeFormModal').modal('show'); // Show the modal with its ID

        });



    </script>
    
 


<script src="/Resources/assets/js/vendor-all.min.js"></script>
<script src="/Resources/assets/js/plugins/bootstrap.min.js"></script>
<script src="/Resources/assets/js/ripple.js"></script>
<script src="/Resources/assets/js/pcoded.min.js"></script>
<script src="/Resources/assets/js/plugins/jquery.mask.min.js"></script>
<script src="/Resources/assets/js/pages/form-masking-custom.js"></script>
   
    
<script src="/Resources/assets/js/vendor-all.min.js"></script>
<script src="/Resources/assets/js/plugins/bootstrap.min.js"></script>
<script src="/Resources/assets/js/ripple.js"></script>
<script src="/Resources/assets/js/pcoded.min.js"></script>
<script src="/Resources/assets/js/plugins/jquery.mask.min.js"></script>
<script src="/Resources/assets/js/pages/form-masking-custom.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
        


</html>

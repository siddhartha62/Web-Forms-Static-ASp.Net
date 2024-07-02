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
        .col{
            display: flex;
            gap: 10px;
        }
        .form-check-input{
            box-shadow: 3px 2px 5px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Notice Add/Modify</h2>
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
    </script>
    <script src="/Resources/assets/js/vendor-all.min.js"></script>
<script src="/Resources/assets/js/plugins/bootstrap.min.js"></script>
<script src="/Resources/assets/js/ripple.js"></script>
<script src="/Resources/assets/js/pcoded.min.js"></script>
<script src="/Resources/assets/js/plugins/jquery.mask.min.js"></script>
<script src="/Resources/assets/js/pages/form-masking-custom.js"></script>

</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsefulLinkAddModify.aspx.cs" Inherits="WebProject.Sites.Notices.UsefulLinkAddModify" %>

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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 500px;
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

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            background-color: #2596be;
            color: #fff;
            cursor: pointer;
            transition: opacity 0.3s ease;
        }

        .btn:hover {
            opacity: 0.7;
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
            height: 150px;
            border: none;
            padding: 10px;
            box-sizing: border-box;
        }

        .col {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .form-check-input {
            box-shadow: 3px 2px 5px rgba(0, 0, 0, 0.5);
        }
        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            background-color: #2596be;
            color: #fff;
            cursor: pointer;
            transition: opacity 0.3s ease;
            margin-left: 18rem;
        }

        .btn:hover {
            opacity: 0.7;
            background-color: #2596be;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Download Group</h2>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="file" class="form-label">Upload File</label>
                <input type="file" class="form-control" id="file" accept="*/*" required>
                <div class="invalid-feedback">This field is required.</div>
            </div>
            <div class="form-group">
                <label for="date" class="form-label">Date</label>
                <input type="text" class="form-control date" data-mask="99/99/9999" autocomplete="off" maxlength="10">
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
            <div class="col">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="Status" checked>
                    <label class="form-check-label" for="Status">Status</label>
                </div>
            </div>
            <button type="submit" class="btn" style="float: left;">Save Changes</button>
        </form>
    </div>

    <script>
        // Form validation
        const form = document.getElementById('form1');
        const description = document.querySelector('.textarea');
        const date = document.querySelector('.date');

        form.addEventListener('submit', (event) => {
            event.preventDefault();

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


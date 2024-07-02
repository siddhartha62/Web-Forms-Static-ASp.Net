<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestCase.aspx.cs" Inherits="WebProject.Sites.Notices.TestCase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="/Resources/assets/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/Resources/assets/css/style.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="pcoded-main-container">
    <div class="pcoded-content">
        <div class="row">
            <!-- [ Classic-editor ] start -->
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Classic Editor</h5>
                    </div>
                    <div class="card-body">
                        <textarea name="content" id="classic-editor">
                                        </textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    </form>
     <script src="/Resources/assets/js/vendor-all.min.js"></script>
    <script src="/Resources/assets/js/plugins/bootstrap.min.js"></script>
    <script src="/Resources/assets/js/ripple.js"></script>
    <script src="/Resources/assets/js/pcoded.min.js"></script>
	

<!-- Ckeditor js -->
<script src="/Resources/assets/js/plugins/ckeditor.js"></script>
<script type="text/javascript">
    $(window).on('load', function() {
        ClassicEditor.create(document.querySelector('#classic-editor'))
            .catch(error => {
                console.error(error);
            });
    });
</script>
</body>
</html>

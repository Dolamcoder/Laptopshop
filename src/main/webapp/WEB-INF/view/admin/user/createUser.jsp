<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create User</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({ "display": "block" });
            });
        });
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --bg-1: #f6f8fc;
            --bg-2: #edf2ff;
            --card: #ffffff;
            --text: #0f172a;
            --muted: #64748b;
            --primary: #4f46e5;
            --primary-2: #6366f1;
            --border: #e2e8f0;
            --danger: #dc2626;
            --shadow: 0 10px 35px rgba(15, 23, 42, 0.08);
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            color: var(--text);
            background:
                radial-gradient(circle at 10% 10%, #e9eeff 0%, transparent 40%),
                radial-gradient(circle at 90% 90%, #e6f7ff 0%, transparent 35%),
                linear-gradient(135deg, var(--bg-1) 0%, var(--bg-2) 100%);
            min-height: 100vh;
            font-family: "Inter", "Segoe UI", Roboto, Arial, sans-serif;
        }

        .page-wrapper {
            max-width: 980px;
            margin: 44px auto;
            padding: 0 14px;
        }

        .form-card {
            border: 1px solid rgba(99, 102, 241, 0.10);
            border-radius: 20px;
            overflow: hidden;
            background: var(--card);
            box-shadow: var(--shadow);
        }

        .form-card .card-header {
            border: 0;
            padding: 20px 24px;
            background: linear-gradient(100deg, #4338ca 0%, #6366f1 60%, #7c3aed 100%);
            color: #ffffff;
        }

        .heading-title {
            margin: 0;
            font-size: 1.25rem;
            font-weight: 700;
            letter-spacing: 0.2px;
        }

        .heading-sub {
            display: block;
            margin-top: 2px;
            color: rgba(255, 255, 255, 0.86);
            font-size: 0.92rem;
        }

        .btn-back {
            border: 1px solid rgba(255, 255, 255, 0.45);
            color: #fff;
            background: rgba(255, 255, 255, 0.14);
            border-radius: 10px;
            font-weight: 600;
            padding: 7px 12px;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .btn-back:hover {
            background: rgba(255, 255, 255, 0.24);
            color: #fff;
        }

        .form-card .card-body {
            padding: 24px;
        }

        .section-title {
            margin: 0 0 14px 0;
            font-size: 0.92rem;
            font-weight: 700;
            color: #334155;
            text-transform: uppercase;
            letter-spacing: 0.6px;
        }

        .form-label {
            font-weight: 600;
            font-size: 0.93rem;
            margin-bottom: 7px;
            color: #0f172a;
        }

        .required-star {
            color: #ef4444;
            margin-left: 3px;
        }

        .form-control,
        .form-select {
            height: 44px;
            border-radius: 12px;
            border: 1px solid var(--border);
            padding: 0 12px;
            font-size: 0.95rem;
            color: #1e293b;
            background-color: #ffffff;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .form-control::placeholder {
            color: #94a3b8;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #818cf8;
            box-shadow: 0 0 0 0.2rem rgba(99, 102, 241, 0.15);
        }

        input[type="file"].form-control {
            padding-top: 8px;
            line-height: 1.3;
        }

        .error-text {
            margin-top: 6px;
            display: block;
            color: var(--danger);
            font-size: 0.84rem;
            font-weight: 500;
        }

        .actions {
            border-top: 1px dashed #dbe3f3;
            margin-top: 10px;
            padding-top: 18px;
        }

        .btn-action {
            min-width: 130px;
            border-radius: 12px;
            font-weight: 600;
            padding: 10px 16px;
            letter-spacing: 0.2px;
        }

        .btn-cancel {
            border: 1px solid #cbd5e1;
            color: #334155;
            background: #fff;
        }

        .btn-cancel:hover {
            background: #f8fafc;
            color: #0f172a;
            border-color: #94a3b8;
        }

        .btn-save {
            border: none;
            color: #fff;
            background: linear-gradient(100deg, var(--primary) 0%, var(--primary-2) 100%);
            box-shadow: 0 8px 18px rgba(79, 70, 229, 0.28);
        }

        .btn-save:hover {
            filter: brightness(1.03);
            color: #fff;
        }

        @media (max-width: 768px) {
            .page-wrapper {
                margin-top: 20px;
            }

            .form-card .card-header,
            .form-card .card-body {
                padding: 16px;
            }

            .actions .btn-action {
                min-width: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="page-wrapper">
        <div class="card form-card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <h4 class="heading-title">Create New User</h4>
                    <small class="heading-sub">Nhập thông tin người dùng và phân quyền truy cập</small>
                </div>
                <a href="/admin/user" class="btn-back">Back to List</a>
            </div>

            <div class="card-body">
                <h6 class="section-title">User Information</h6>

                <form:form method="post" action="/admin/user" enctype="multipart/form-data"
                    modelAttribute="user">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Email<span class="required-star">*</span></label>
                            <form:input path="email" type="email" class="form-control"
                                placeholder="example@company.com" />
                            <form:errors path="email" cssClass="error-text" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Password<span class="required-star">*</span></label>
                            <form:password path="password" class="form-control" placeholder="Enter password" />
                            <form:errors path="password" cssClass="error-text" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Full Name<span class="required-star">*</span></label>
                            <form:input path="fullName" class="form-control" placeholder="Nguyen Van A" />
                            <form:errors path="fullName" cssClass="error-text" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Phone</label>
                            <form:input path="phone" class="form-control" placeholder="0123 456 789" />
                            <form:errors path="phone" cssClass="error-text" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Address</label>
                            <form:input path="address" class="form-control"
                                placeholder="Street, Ward, District, City" />
                            <form:errors path="address" cssClass="error-text" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Role<span class="required-star">*</span></label>
                            <form:select path="role.id">
                                <form:options items="${roles}" itemValue="id" itemLabel="name" />
                            </form:select>
                            <form:errors path="role.id" cssClass="error-text" />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Avatar</label>
                            <input type="file" id="avatarFile" name="lamhello" class="form-control"
                                accept=".png, .jpg, .jpeg" />
                            <img id="avatarPreview" style="display:none;width:200px;margin-top:10px;border-radius:8px;">
                        </div>
                    </div>
                    <div class="actions d-flex justify-content-end gap-2 flex-wrap">
                        <a href="/admin/user" class="btn btn-action btn-cancel">Cancel</a>
                        <button type="submit" class="btn btn-action btn-save">Create User</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>

</html>
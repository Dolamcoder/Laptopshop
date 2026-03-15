<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <title>User Detail</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <div class="card shadow">

        <div class="card-header bg-primary text-white">
            <h4>User Detail</h4>
        </div>

        <div class="card-body">

            <div class="row">

                <!-- Avatar -->
                <div class="col-md-4 text-center">

                    <img src="/images/avatar/${user.avatar}"
                         class="img-fluid rounded-circle border"
                         style="width:200px;height:200px;object-fit:cover;">

                </div>

                <!-- User Info -->
                <div class="col-md-8">

                    <table class="table table-bordered">

                        <tr>
                            <th width="30%">ID</th>
                            <td>${user.id}</td>
                        </tr>

                        <tr>
                            <th>Email</th>
                            <td>${user.email}</td>
                        </tr>

                        <tr>
                            <th>Password</th>
                            <td>${user.password}</td>
                        </tr>

                        <tr>
                            <th>Full Name</th>
                            <td>${user.fullName}</td>
                        </tr>

                        <tr>
                            <th>Address</th>
                            <td>${user.address}</td>
                        </tr>

                        <tr>
                            <th>Phone</th>
                            <td>${user.phone}</td>
                        </tr>

                        <tr>
                            <th>Role</th>
                            <td>${user.role.name}</td>
                        </tr>

                    </table>

                </div>

            </div>

        </div>

        <div class="card-footer text-end">

            <a href="/admin/user" class="btn btn-secondary">
                Back
            </a>

        </div>

    </div>

</div>

</body>
</html>

<%-- Document : AdminDasboard Created on : Jun 29, 2023, 11:45:44 AM Author : ASUS PC --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard - SB Admin</title>
                <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/styles.css" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

            </head>

            <body class="sb-nav-fixed">
                <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                    <!-- Navbar Brand-->
                    <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
                    <!-- Sidebar Toggle-->
                    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                            class="fas fa-bars"></i></button>
                    <!-- Navbar Search-->
                    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="Search for..."
                                aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                                    class="fas fa-search"></i></button>
                        </div>
                    </form>
                    <!-- Navbar-->
                    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">Settings</a></li>
                                <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>
                                <li><a class="dropdown-item" href="#!">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                            <div class="sb-sidenav-menu">
                                <div class="nav">
                                    <div class="sb-sidenav-menu-heading">Core</div>
                                    <a class="nav-link" href="index.html">
                                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        Dashboard
                                    </a>
                                    <div class="sb-sidenav-menu-heading">Interface</div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                        data-bs-target="#collapseLayouts" aria-expanded="false"
                                        aria-controls="collapseLayouts">
                                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                        Layouts
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                                        data-bs-parent="#sidenavAccordion">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                            <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                        data-bs-target="#collapsePages" aria-expanded="false"
                                        aria-controls="collapsePages">
                                        <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                        Pages
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                                        data-bs-parent="#sidenavAccordion">
                                        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                                data-bs-target="#pagesCollapseAuth" aria-expanded="false"
                                                aria-controls="pagesCollapseAuth">
                                                Authentication
                                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                                </div>
                                            </a>
                                            <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                                                data-bs-parent="#sidenavAccordionPages">
                                                <nav class="sb-sidenav-menu-nested nav">
                                                    <a class="nav-link" href="login.html">Login</a>
                                                    <a class="nav-link" href="register.html">Register</a>
                                                    <a class="nav-link" href="password.html">Forgot Password</a>
                                                </nav>
                                            </div>
                                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                                data-bs-target="#pagesCollapseError" aria-expanded="false"
                                                aria-controls="pagesCollapseError">
                                                Error
                                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                                </div>
                                            </a>
                                            <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                                                data-bs-parent="#sidenavAccordionPages">
                                                <nav class="sb-sidenav-menu-nested nav">
                                                    <a class="nav-link" href="401.html">401 Page</a>
                                                    <a class="nav-link" href="404.html">404 Page</a>
                                                    <a class="nav-link" href="500.html">500 Page</a>
                                                </nav>
                                            </div>
                                        </nav>
                                    </div>
                                    <div class="sb-sidenav-menu-heading">Addons</div>
                                    <a class="nav-link" href="charts.html">
                                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                        Charts
                                    </a>
                                    <a class="nav-link" href="tables.html">
                                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                        Tables
                                    </a>
                                </div>
                            </div>
                            <div class="sb-sidenav-footer">
                                <div class="small">Logged in as:</div>
                                Start Bootstrap
                            </div>
                        </nav>
                    </div>
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <div class="row">

                                    <div class="row">
                                        <div class="col-xl-6">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-chart-area me-1"></i>
                                                    Number of orders
                                                </div>
                                                <div class="card-body"><canvas id="myAreaChart" width="100%"
                                                        height="40"></canvas></div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-chart-bar me-1"></i>
                                                    Revenue
                                                </div>
                                                <div class="card-body"><canvas id="myBarChart" width="100%"
                                                        height="40"></canvas></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-table me-1"></i>
                                            Order list
                                        </div>
                                        <div class="card-body">
                                            <table id="datatablesSimple">
                                                <thead>
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Address</th>
                                                        <th>Order date</th>
                                                        <th>Status</th>
                                                        <th>Total price</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Address</th>
                                                        <th>Order date</th>
                                                        <th>Status</th>
                                                        <th>Total price</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <!-- Revised table rows -->
                                                    <c:forEach items="${listOrders}" var="order" varStatus="loop">
                                                        <tr>
                                                            <td>${listAccounts.get(loop.index).name}</td>
                                                            <td>${listAccounts.get(loop.index).email}</td>
                                                            <td>${listAccounts.get(loop.index).address}</td>
                                                            <td>${order.orderDate}</td>
                                                            <td>${order.status}</td>
                                                            <td>${order.totalPrice}.000₫</td>
                                                        </tr>
                                                    </c:forEach>
                                                    <tr>
                                                        <td>Tiger Nixon</td>
                                                        <td>Nixon@gmail.com</td>
                                                        <td>Ha Noi, Viet Nam</td>
                                                        <td>2011/04/25</td>
                                                        <td>Completed</td>
                                                        <td>320.800₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Garrett Winters</td>
                                                        <td>Winters@fpt.edu.vn</td>
                                                        <td>Tokyo</td>
                                                        <td>2011/07/25</td>
                                                        <td>Processing</td>
                                                        <td>170.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ashton Cox</td>
                                                        <td>Ashton123@yahoo.com</td>
                                                        <td>San Francisco</td>
                                                        <td>2009/01/12</td>
                                                        <td>Cancelled</td>
                                                        <td>85.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Cedric Kelly</td>
                                                        <td>Senior@gmail.com</td>
                                                        <td>Edinburgh</td>
                                                        <td>2012/03/29</td>
                                                        <td>Completed</td>
                                                        <td>433.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Airi Satou</td>
                                                        <td>Accountant@gmail.com</td>
                                                        <td>Tokyo</td>
                                                        <td>2008/11/28</td>
                                                        <td>Processing</td>
                                                        <td>162.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Brielle Williamson</td>
                                                        <td>Integration@gmail.com</td>
                                                        <td>New York</td>
                                                        <td>2012/12/02</td>
                                                        <td>Completed</td>
                                                        <td>372.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Herrod Chandler</td>
                                                        <td>Sales@gmail.com</td>
                                                        <td>San Francisco</td>
                                                        <td>2012/08/06</td>
                                                        <td>Processing</td>
                                                        <td>137.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Rhona Davidson</td>
                                                        <td>Integration@gmail.com</td>
                                                        <td>Tokyo</td>
                                                        <td>2010/10/14</td>
                                                        <td>Cancelled</td>
                                                        <td>327.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Colleen Hurst</td>
                                                        <td>Javascript Developer</td>
                                                        <td>San Francisco</td>
                                                        <td>2009/09/15</td>
                                                        <td>Completed</td>
                                                        <td>205.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Sonya Frost</td>
                                                        <td>Software.Engineer@gmail.com</td>
                                                        <td>Edinburgh</td>
                                                        <td>2008/12/13</td>
                                                        <td>Processing</td>
                                                        <td>103.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Jena Gaines</td>
                                                        <td>Office.Manager@fpt.edu.vn</td>
                                                        <td>London</td>
                                                        <td>2008/12/19</td>
                                                        <td>Cancelled</td>
                                                        <td>90.5000₫/td>
                                                    </tr>
                                                    <tr>
                                                        <td>Quinn Flynn</td>
                                                        <td>Support@fpt.edu.vn</td>
                                                        <td>Edinburgh</td>
                                                        <td>2013/03/03</td>
                                                        <td>Completed</td>
                                                        <td>342.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Charde Marshall</td>
                                                        <td>Regional@fpt.edu.vn</td>
                                                        <td>San Francisco</td>
                                                        <td>2008/10/16</td>
                                                        <td>Processing</td>
                                                        <td>470.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Haley Kennedy</td>
                                                        <td>Kennedy@fpt.edu.vn</td>
                                                        <td>London</td>
                                                        <td>2012/12/18</td>
                                                        <td>Completed</td>
                                                        <td>313.000₫</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Tatyana Fitzpatrick</td>
                                                        <td>Regional Director</td>
                                                        <td>London</td>
                                                        <td>2010/03/17</td>
                                                        <td>Cancelled</td>
                                                        <td>385.000₫</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                        </main>
                        <footer class="py-4 bg-light mt-auto">
                            <div class="container-fluid px-4">
                                <div class="d-flex align-items-center justify-content-between small">
                                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                                    <div>
                                        <a href="#">Privacy Policy</a>
                                        &middot;
                                        <a href="#">Terms &amp; Conditions</a>
                                    </div>
                                </div>
                            </div>
                        </footer>
                    </div>
                </div>
                <script>
                    window.addEventListener('DOMContentLoaded', event => {

                        // Toggle the side navigation
                        const sidebarToggle = document.body.querySelector('#sidebarToggle');
                        if (sidebarToggle) {
                            // Uncomment Below to persist sidebar toggle between refreshes
                            // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
                            //     document.body.classList.toggle('sb-sidenav-toggled');
                            // }
                            sidebarToggle.addEventListener('click', event => {
                                event.preventDefault();
                                document.body.classList.toggle('sb-sidenav-toggled');
                                localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
                            });
                        }

                    });

                </script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="assets/demo/chart-area-demo.js"></script>
                <script src="assets/demo/chart-bar-demo.js"></script>
                <script src="js/simple-datatables.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.2.0/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/datatables-simple-demo.js"></script>
            </body>

            </html>
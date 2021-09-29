<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/checkout/">

<div id="registerPage" class="bg-light">

    <div class="container">

        <div class="row">
            <div class="col-md-8 order-md-1">
                <h4 class="mb-3">MemberRegister</h4>
                <%--novalidate--%>
                <form id="registerFormT" name="registerForm" class="needs-validation" onsubmit="return false" action=""
                      method="post" onchange="check_null()">
                    <fieldset>
                        <script>
                            let pw;
                            let pw_confirm;
                        </script>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" name="member_name" placeholder="name"
                                       value="" required>
                                <div class="invalid-feedback">
                                    name is required.
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="password">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" name="member_password"
                                        placeholder="Password" required>
                                <div class="invalid-feedback" style="width: 100%;">
                                    Password is required.
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="password_confirm">Password Confirm</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password_confirm" placeholder="Password"
                                      required>
                                <div class="invalid-feedback" style="width: 100%;">
                                    Password is required.
                                </div>

                            </div>
                        </div>
                        <p><span id="check"></span></p>
                        <div class="mb-3">
                            <label for="email">Email </label>
                            <input type="email" class="form-control" name="member_mail" id="email"
                                   placeholder="you@example.com" onkeyup="emailValueCheck()" required>
<%--                            <input type="button" value="DuplicateCheck" id="duplicateCheck" onclick="openIdCheck()">--%>
<%--                            <input type="hidden" name="emailDuplication" value="idUncheck">--%>
                            <p><span id="mailCheck"></span></p>
                            <div class="invalid-feedback">
                                Please enter a valid email address for check Reservation or ID.
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="member_phone">PhoneNumber</label>
                            <input type="number" class="form-control" name="member_phone" id="member_phone"
                                   placeholder="010-0000-0000" required>
                            <div class="invalid-feedback">
                                Please enter your Mobile or Phone Number.
                            </div>
                        </div>
                    </fieldset>
                </form>

                <button id="registerButton" class="btn btn-primary btn-lg btn-block" type="button" onclick="RegisterAction()"  disabled>SignUp !
                </button>

            </div>
        </div>
    </div>
</div>

</div>

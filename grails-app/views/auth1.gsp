%{--
<html>
<head>
    <meta name='layout' content='loanMavenLayoutNew'/>
    <asset:link rel="shortcut icon" href="/favicon.png"></asset:link>
    <style>
    a.hover {
        color: green;
        text-decoration: none;
    }

    a.hover:hover {
        text-decoration: underline;
        color: #32c5d2;
    }
    </style>
</head>

<body>
<section id="loginFormSection" style="min-height: 400px">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <h3 class="text-info text-center" style="margin: 10px 0;margin-top: 50px">Login</h3>
                <g:if test='${flash.message}'>
                    <div class="alert alert-warning fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        ${flash.message}
                    </div>
                </g:if>
                <form action='${request.contextPath}/login/authenticate' method='POST' id='loginForm' class='cssform'
                      style="margin-top: 30px"
                      autocomplete='off'>

                    <ul class="nav nav-tabs" style="text-align: center;">
                        <li class="item12 active" style="float:none; display:inline-block; zoom:1;">
                            <a data-toggle="tab" href="#emailSec">Email</a></li>
                        <li class="item11 " style="float:none; display:inline-block; zoom:1;">
                            <a data-toggle="tab" href="#phoneSec">Phone</a></li>
                    </ul>

                    <br>

                    <div class="tab-content">

                        <div id="emailSec" class="tab-pane fade in active">

                            <div class="input-group" style="width: 97%">
                                <input type="text" name="username" id="usernameEmailSec" class="form-control"
                                       placeholder="Your email" required>
                            </div>

                            <div class="input-group" style="width: 97%; margin-top: 15px">
                                <input type="password" name="password" id="passwordEmailSec"
                                       class="form-control"
                                       placeholder="Your Password" required>
                                <span class="input-group-btn">
                                    <button id="showPasswordEmailSec" class="btn btn-secondary" type="button">
                                        <span class="glyphicon glyphicon-eye-open" style="line-height: 1.8"></span>
                                    </button>
                                </span>
                            </div>

                        </div>

                        <div id="phoneSec" class="tab-pane fade in ">

                            <div class="row">
                                <div class="col-sm-5">
                                    <g:select id="countryCodeLogInId" class="form-control"
                                              name="countryCode"
                                              from="${['Cameroon (+237)', 'Nigeria (+234)', 'Congo (+242)', 'Estonia (+372)', 'UK (+44)', 'India (+91)']}"
                                              noSelection="${['': 'Select a Country']}"
                                              keys="[237, 234, 242, 372, 44, 91]"></g:select>
                                </div>

                                <div class="col-sm-7">
                                    <input type="text" name="username" class="form-control"
                                           id="usernamePhoneSec"
                                           placeholder="Your Phone Number"
                                           oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                           style="border-radius: 3px" required>
                                </div>
                            </div>


                            <div class="input-group" style="margin-top: 15px; width: 97%;">
                                <input type="password" name="password" id="passwordPhoneSec"
                                       class="form-control"
                                       placeholder="Your Password" required>
                                <span class="input-group-btn">
                                    <button id="showPasswordPhoneSec" class="btn btn-secondary" type="button">
                                        <span class="glyphicon glyphicon-eye-open" style="line-height: 1.8"></span>
                                    </button>
                                </span>
                            </div>

                        </div>

                    </div>

                    <div class="divide15"></div>

                    --}%
%{--                    <input type="submit" id="loginSubmit" style="display: none">--}%%{--

                    --}%
%{--                    <button type="submit" class="btn btn-red btn-lg" style="width: 100%;"--}%%{--

                    --}%
%{--                            onclick="$('#loginSubmit').click()">Continue</button>--}%%{--

                    <input type="submit" onclick="ajaxAuthLogin()" class="btn btn-red btn-lg" value="Continue"
                           style="width: 100%;"/>
                </form>

                <div class="divide10"></div>


                <div class="row">
                    <div class="col-md-6 pull-left">
                        <input type="checkbox" id="remember_me" name="remember_pass"
                               <g:if test='${hasCookie}'>checked='checked'</g:if>>
                        <label for="remember_me">Remember me</label>
                    </div>

                    <div class="col-md-6 pull-right">
                        <a href="#" onclick="resetUserPassword()" class="link pull-right"
                           style="margin-right: 23px">Forgot password?</a>
                    </div>
                </div>

                <div class="divide10"></div>

                <div class="form-group" id="resetPasswordSection" style="display: none">
                    <input type="text" id="resetUsername" name="resetUsername"
                           placeholder="Enter email id or phone number"
                           class="form-control">

                    <span class="help-block" id="helpBlock"
                          style="text-align: center">Phone number should start with + following the country code</span>


                    <div id="resetValidation" class="alert text-center">
                        <input type="button" class="btn btn-success" onclick="initReset()" value="Reset"/>
                    </div>
                </div>

                <div id="signInLoading" style="text-align: center;" hidden="hidden">
                    <asset:image src="Rolling-1s-200px.gif" style="max-height: 50px; max-width: 100px"></asset:image>
                </div>

                <div id="loginValidationSec" class="alert-danger alert" hidden="hidden"
                     style="margin-left: 25px;margin-right: 25px;margin-top: 3px; text-align: center">
                </div>


                <div class="row" style="color: green">
                    <br/>

                    <p class="text-center" id="newUser">
                        --}%
%{--                        <g:link controller="signUp" action="initRegistration"--}%%{--

                        --}%
%{--                                class="link hover">Not a member yet?</g:link>--}%%{--

                        --}%
%{--                        //TODO Make register page consistent--}%%{--

                        <a href="#" class="hover" data-toggle="modal" id="headerSignupButton" data-target="#sign_up"
                           data-dismiss="modal" aria-hidden="true" style="">Not a member yet?</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

</section>

<div class="divide60"></div>

<script type='text/javascript'>


    //Toggle password eye icon
    $("#showPasswordPhoneSec").hover(
        function () {
            //Change the attribute to text
            $("#passwordPhoneSec").attr("type", "text");
            $(".glyphicon")
                .removeClass("glyphicon-eye-open")
                .addClass("glyphicon-eye-close");
        },
        function () {
            //Change the attribute back to password
            $("#passwordPhoneSec").attr("type", "password");
            $(".glyphicon")
                .removeClass("glyphicon-eye-close")
                .addClass("glyphicon-eye-open");
        }
    );

    $("#showPasswordEmailSec").hover(
        function () {
            //Change the attribute to text
            $("#passwordEmailSec").attr("type", "text");
            $(".glyphicon")
                .removeClass("glyphicon-eye-open")
                .addClass("glyphicon-eye-close");
        },
        function () {
            //Change the attribute back to password
            $("#passwordEmailSec").attr("type", "password");
            $(".glyphicon")
                .removeClass("glyphicon-eye-close")
                .addClass("glyphicon-eye-open");
        }
    );

    // (function () {
    //     document.forms['loginForm'].elements['username'].focus();
    // })();

    function ajaxAuthLogin() {
        event.preventDefault();
        $('#signInLoading').show();
        var password;
        var username;
        //Phone Tab is clicked
        if ($('li.item11').hasClass('active')) {
            console.log("phone");
            var userPhoneNumber = $('#usernamePhoneSec').val();
            username = '+' + $('#countryCodeLogInId').val() + userPhoneNumber;
            password = $('#passwordPhoneSec').val();
            var filterPhoneNumber = /^\d{1,10}$/;
            if (userPhoneNumber.length != 0) {
                if (!(filterPhoneNumber.test(userPhoneNumber))) {
                    $('#signInLoading').hide();
                    $('#loginValidationSec').text("Invalid phone number").slideDown(1000);
                    setTimeout(function () {
                        $('#loginValidationSec').slideUp(1000)
                    }, 3000)
                    return false;
                }
            }
        }
        //Email Tab is clicked
        else {
            console.log("email");
            username = $('#usernameEmailSec').val();
            password = $('#passwordEmailSec').val();
            var filterEmail = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
            if (username.length != 0) {
                if (!filterEmail.test(username)) {
                    $('#signInLoading').hide();
                    $('#loginValidationSec').text("Invalid email").slideDown(1000);
                    setTimeout(function () {
                        $('#loginValidationSec').slideUp(1000)
                    }, 3000)
                    return false;
                }
            }
        }

        var url = $('#appBaseUrl').val() + '/login/authenticate';
        var data = 'username=' + username + '&' + 'password=' + password;
        // console.log("data: " + data);
        $.ajax({
            url: url,
            type: 'POST',
            data: data,
            success: function (data) {
                if (data.success) {
                    $('#signInLoading').hide();
                    location.reload()
                } else {
                    $('#signInLoading').hide();
                    $('#loginValidationSec').text("Invalid username or password").slideDown(1000);
                    setTimeout(function () {
                        $('#loginValidationSec').slideUp(1000)
                    }, 3000)
                    console.log("sign up fail 1");
                }
            }
            // error: function () {
            //     $('#signInloading').hide();
            //     $('#loginValidation').text("Something went wrong").slideDown(1000);
            //     setTimeout(function () {
            //         $('#loginValidation').slideUp(1000)
            //     }, 3000)
            //     console.log("sign up fail 2");
            // }
        });
    }


    function resetUserPassword() {
        console.log("Pass reset");
        $('#resetPasswordSection').slideToggle(1000);
        $('#')
    }

    function initReset() {
        var url = "${createLink(controller: 'public',action: 'initResetPassword')}";
        var data = {userName: $('#resetUsername').val()};
        $.ajax({
            url: url,
            data: data,
            success: function (data) {
                if (data.error) {
                    $('#resetValidation').show().removeClass('alert-success').addClass('alert-danger').text(data.error)
                } else
                    $('#resetValidation').show().removeClass('alert-danger').addClass('alert-success').text("Please check your email and follow the mentioned steps");
                setTimeout(function () {
                    $('#resetValidation').hide()
                }, 3000)
            }
        })
    }

</script>
</body>
</html>--}%

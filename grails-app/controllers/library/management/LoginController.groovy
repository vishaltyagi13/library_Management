import com.security.User
import grails.plugin.springsecurity.SpringSecurityUtils


import grails.converters.JSON

import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.AuthenticationTrustResolver
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.WebAttributes
import org.springframework.security.web.authentication.session.SessionAuthenticationException

import javax.servlet.http.HttpServletResponse

@Secured('permitAll')
class LoginController extends grails.plugin.springsecurity.LoginController {


    def authfail() {

        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = message('springSecurity.errors.login.expired', null, "Account Expired", request.locale)
            } else if (exception instanceof CredentialsExpiredException) {
                msg = message('springSecurity.errors.login.passwordExpired', null, "Password Expired", request.locale)
            } else if (exception instanceof DisabledException) {
                msg = message('springSecurity.errors.login.disabled', null, "Account Disabled", request.locale)
            } else if (exception instanceof LockedException) {
                msg = message('springSecurity.errors.login.locked', null, "Account Locked", request.locale)
            } else if (exception instanceof SessionAuthenticationException) {
                msg = message('springSecurity.errors.login.max.sessions.exceeded', null, "Sorry, you have exceeded your maximum number of open sessions.", request.locale)
            } else {
                msg = message('springSecurity.errors.login.fail', null, "Authentication Failure", request.locale)
            }
        }

        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        } else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
    }


    def auth() {

        def conf = getConf()

        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
            return
        }


        String postUrl = request.contextPath + conf.apf.filterProcessesUrl
        render view: '/libraryManagementSystem/auth', model: [postUrl            : postUrl,
                                                              rememberMeParameter: conf.rememberMe.parameter,
                                                              usernameParameter  : conf.apf.usernameParameter,
                                                              passwordParameter  : conf.apf.passwordParameter,
                                                              gspLayout          : conf.gsp.layoutAuth]
    }
}
dataSource {
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
    pooled = false
    dbCreate = "update"
    url = "jdbc:mysql://localhost:3306/library_management?autoreconnect=true&allowMultiQueries=true&useUnicode=yes&characterEncoding=UTF-8"
    username = "root"
    logSql = false
    password = "nextdefault"
}


// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.security.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.security.UserRole'
grails.plugin.springsecurity.authority.className = 'com.security.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        [pattern: '/', access: ['permitAll']],
        [pattern: '/error', access: ['permitAll']],
        [pattern: '/index', access: ['permitAll']],
        [pattern: '/index.gsp', access: ['permitAll']],
        [pattern: '/shutdown', access: ['permitAll']],
        [pattern: '/assets/**', access: ['permitAll']],
        [pattern: '/**/js/**', access: ['permitAll']],
        [pattern: '/**/css/**', access: ['permitAll']],
        [pattern: '/**/images/**', access: ['permitAll']],
        [pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
        [pattern: '/assets/**', filters: 'none'],
        [pattern: '/**/js/**', filters: 'none'],
        [pattern: '/**/css/**', filters: 'none'],
        [pattern: '/**/images/**', filters: 'none'],
        [pattern: '/**/favicon.ico', filters: 'none'],
        [pattern: '/**', filters: 'JOINED_FILTERS']
]
grails.plugin.springsecurity.rejectIfNoRule = false
grails.plugin.springsecurity.fii.rejectPublicInvocations = false
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.successHandler.alwaysUseDefault = true
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/library/view'



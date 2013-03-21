dataSource {
    pooled = true
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            driverClassName = "org.h2.Driver"
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    test {
        dataSource {
            driverClassName = "org.h2.Driver"
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
//        dataSource {
//            dbCreate = "update"
//            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//            pooled = true
//            properties {
//               maxActive = -1
//               minEvictableIdleTimeMillis=1800000
//               timeBetweenEvictionRunsMillis=1800000
//               numTestsPerEvictionRun=3
//               testOnBorrow=true
//               testWhileIdle=true
//               testOnReturn=true
//               validationQuery="SELECT 1"
//            }
//        }

        dataSource {
            logSql = true
            dbCreate = 'update'
            username = System.env.PARAM1  //set as env var
            password= System.env.PARAM2
            dialect = org.hibernate.dialect.Oracle10gDialect
            url = System.env.JDBC_CONNECTION_STRING
            driverClassName = "oracle.jdbc.OracleDriver"
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 1
                initialSize = 1
                maxWait = 10000
                timeBetweenEvictionRunsMillis=60000
                numTestsPerEvictionRun=3
                minEvictableIdleTimeMillis=60000
            }
        }
    }
}

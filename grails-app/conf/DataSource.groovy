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
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=11000"
        }
    }
    production {
        dataSource {
            logSql = true
            dbCreate = 'update'
            username = System.getProperty("PARAM1")
            password= System.getProperty("PARAM2")
            dialect = org.hibernate.dialect.Oracle10gDialect
            url = System.getProperty("JDBC_CONNECTION_STRING")
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

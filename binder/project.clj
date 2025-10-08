(defproject datomic-binder "0.1.0"
  :description "A simple Datomic example for mybinder.org"
  :dependencies [[org.clojure/clojure "1.11.1"]
                 [com.datomic/dev-local "1.0.243"]]
  :main datomic-binder.core
  :aot [datomic-binder.core])
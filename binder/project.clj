(defproject datomic-binder "0.1.0"
  :description "A simple Datomic example for mybinder.org"
  :dependencies [[org.clojure/clojure "1.11.1"]
                 [com.datomic/dev-local "1.0.243"]
                 [org.clojure/tools.reader "1.3.6"]]
  :repl-options {:init-ns datomic-binder.core}
  :main datomic-binder.core)
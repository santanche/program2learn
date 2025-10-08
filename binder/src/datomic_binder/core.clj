(ns datomic-binder.core
  (:require [datomic.dev-local :as d]
            [datomic.api :as datomic])
  (:gen-class))

(defn -main [& args]
  (println "=== Starting Datomic Example ===")
  
  ;;; 1. CREATE AND CONNECT TO AN IN-MEMORY DATABASE
  (println "Connecting to in-memory database...")
  (def conn (d/connect "datomic:mem://example-db"))

  ;;; 2. DEFINE A SIMPLE SCHEMA
  (println "Defining schema...")
  (def schema-tx
    [{:db/ident :student/name
      :db/valueType :db.type/string
      :db/cardinality :db.cardinality/one
      :db/doc "A student's name"}
     {:db/ident :student/course
      :db/valueType :db.type/string
      :db/cardinality :db.cardinality/many
      :db/doc "A course the student is taking"}])

  @(datomic/transact conn schema-tx)

  ;;; 3. ADD SOME SAMPLE DATA
  (println "Adding sample data...")
  (def sample-data-tx
    [{:student/name "Alice"
      :student/course #{"Logic 101" "Databases"}}
     {:student/name "Bob" 
      :student/course #{"Logic 101" "Prolog"}}
     {:student/name "Charlie"
      :student/course #{"Databases"}}])

  @(datomic/transact conn sample-data-tx)

  ;;; 4. RUN QUERIES (YOUR "PROLOG" LESSON)
  (println "\n--- Running Queries ---")
  
  ;; Example 1: Find all student names.
  (defn all-names []
    (datomic/q '[:find ?name
                 :where [?e :student/name ?name]]
               (datomic/db conn)))

  ;; Example 2: Find who takes "Logic 101".
  (defn in-logic-101 []
    (datomic/q '[:find ?name
                 :where [?e :student/name ?name]
                        [?e :student/course "Logic 101"]]
               (datomic/db conn)))

  ;; Example 3: Find all pairs of students who share a course.
  (defn course-mates []
    (datomic/q '[:find ?name1 ?name2 ?shared-course
                 :where [?e1 :student/name ?name1]
                        [?e2 :student/name ?name2]
                        [?e1 :student/course ?shared-course]
                        [?e2 :student/course ?shared-course]
                        [(not= ?e1 ?e2)]
                        [(< (compare ?name1 ?name2) 0)]]
               (datomic/db conn)))

  ;;; 5. PRINT THE RESULTS
  (println "All student names:" (all-names))
  (println "Students in Logic 101:" (in-logic-101)) 
  (println "Students who share courses:" (course-mates))
  
  (println "\n=== Example Complete ==="))
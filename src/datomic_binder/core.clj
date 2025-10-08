(ns datomic-binder.core
  (:require [datomic.dev-local :as d]
            [datomic.api :as datomic]))

;;; 1. CREATE AND CONNECT TO AN IN-MEMORY DATABASE
(def conn (d/connect "datomic:mem://example-db"))

;;; 2. DEFINE A SIMPLE SCHEMA
;; This is a one-time operation. The transaction data is a vector of maps.
(def schema-tx
  [{:db/ident :student/name
    :db/valueType :db.type/string
    :db/cardinality :db.cardinality/one
    :db/doc "A student's name"}
   {:db/ident :student/course
    :db/valueType :db.type/string
    :db/cardinality :db.cardinality/many
    :db/doc "A course the student is taking"}])

;; Transact the schema to the database.
@(datomic/transact conn schema-tx)

;;; 3. ADD SOME SAMPLE DATA
(def sample-data-tx
  [{:student/name "Alice"
    :student/course #{"Logic 101" "Databases"}}
   {:student/name "Bob"
    :student/course #{"Logic 101" "Prolog"}}
   {:student/name "Charlie"
    :student/course #{"Databases"}}])

@(datomic/transact conn sample-data-tx)

;;; 4. RUN QUERIES (YOUR "PROLOG" LESSON)
;; This is where you teach Datalog, which is heavily inspired by Prolog.
;; It's a declarative logic query language.

;; Example 1: Find all student names.
(defn all-names []
  (datomic/q '[:find ?name
               :where [?e :student/name ?name]]
             (datomic/db conn)))

;; Example 2: Find who takes "Logic 101".
;; Notice the logical variable `?course` in the where clause.
(defn in-logic-101 []
  (datomic/q '[:find ?name
               :where [?e :student/name ?name]
                      [?e :student/course "Logic 101"]]
             (datomic/db conn)))

;; Example 3: Find all pairs of students who share a course.
;; This demonstrates joining data, a core concept in logic programming.
(defn course-mates []
  (datomic/q '[:find ?name1 ?name2 ?shared-course
               :where [?e1 :student/name ?name1]
                      [?e2 :student/name ?name2]
                      [?e1 :student/course ?shared-course]
                      [?e2 :student/course ?shared-course]
                      [(not= ?e1 ?e2)] ; Avoid matching a student with themselves
                      [(< ?e1 ?e2)]] ; Avoid duplicate pairs (Alice-Bob vs Bob-Alice)
             (datomic/db conn)))

;;; 5. PRINT THE RESULTS
(println "All student names:" (all-names))
(println "Students in Logic 101:" (in-logic-101))
(println "Students who share courses:" (course-mates))
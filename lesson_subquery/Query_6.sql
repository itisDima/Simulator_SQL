SELECT
     CAST(AGE((SELECT MAX(time) FROM courier_actions) :: DATE, 
     (SELECT MAX(birth_date) FROM couriers WHERE sex= 'male') ::DATE) AS VARCHAR) AS min_age
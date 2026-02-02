# HW #2 Answers

## Question 1.

Within the execution for `Yellow` Taxi data for the year `2020` and month `12`: what is the uncompressed file size (i.e. the output file `yellow_tripdata_2020-12.csv` of the `extract` task)?
- 128.3 MB
- 134.5 MB
- 364.7 MB
- 692.6 MB

:white_check_mark: ANSWER **128.3 MB**

![image alt ](https://github.com/harikesavb/Data-Engineering-Datatalks/blob/9123de930807a9d6377345315a6662908464e2bd/homework2_work/homework2_ss/que-1.png)

:pencil: Kestra -> Executions -> Output (for yellow 12/2020)
-> extract | outputFiles | yellow-tripdata_2020-12.csv
128.3 MiB

:bulb: Learn more about outputs on [kestra](https://kestra.io/docs/workflow-components/outputs#outputs-preview)


## Question 2.
What is the rendered value of the variable `file` when the inputs `taxi` is set to `green`, `year` is set to `2020`, and `month` is set to `04` during execution?
- `{{inputs.taxi}}_tripdata_{{inputs.year}}-{{inputs.month}}.csv` 
- `green_tripdata_2020-04.csv`
- `green_tripdata_04_2020.csv`
- `green_tripdata_2020.csv`

:white_check_mark: ANSWER **`green_tripdata_2020-04.csv`**

:pencil: we use render to get the string when variable inputs are involved, thus the
output here would not be choice 1, but that is actually our file variable format, so just 
'plug and chug' here to get your answer.


## Question 3. 
How many rows are there for the `Yellow` Taxi data for all CSV files in the year 2020?
- 13,537.299
- 24,648,499
- 18,324,219
- 29,430,127

:white_check_mark: ANSWER **24,648,499**

![image alt](https://github.com/harikesavb/Data-Engineering-Datatalks/blob/9123de930807a9d6377345315a6662908464e2bd/homework2_work/homework2_ss/yellow-taxi-2020-rowcount.png)

## Question 4.
How many rows are there for the `Green` Taxi data for all CSV files in the year 2020?
- 5,327,301
- 936,199
- 1,734,051
- 1,342,034

:white_check_mark: ANSWER **1,734,051**

![image alt](https://github.com/harikesavb/Data-Engineering-Datatalks/blob/9123de930807a9d6377345315a6662908464e2bd/homework2_work/homework2_ss/green-taxi-2020-rowcount.png)

## Question 5.
How many rows are there for the `Yellow` Taxi data for the March 2021 CSV file?
- 1,428,092
- 706,911
- 1,925,152
- 2,561,031

:white_check_mark: ANSWER **1,925,152**

![image alt](https://github.com/harikesavb/Data-Engineering-Datatalks/blob/9123de930807a9d6377345315a6662908464e2bd/homework2_work/homework2_ss/yellow-taxi-2021-03-rowcount.png)

## Question 6.
How would you configure the timezone to New York in a Schedule trigger?
- Add a `timezone` property set to `EST` in the `Schedule` trigger configuration  
- Add a `timezone` property set to `America/New_York` in the `Schedule` trigger configuration
- Add a `timezone` property set to `UTC-5` in the `Schedule` trigger configuration
- Add a `location` property set to `New_York` in the `Schedule` trigger configuration  

:white_check_mark: ANSWER **`America/New_York`**

:bulb: Learn more here about [Scheduled triggers](https://kestra.io/docs/workflow-components/triggers/schedule-trigger)

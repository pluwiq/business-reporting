# Business Reporting

## Short Description

Console application that generates reports on the results of the analysis of tables
in various documents (`.json` and `.csv`).

## Estimation (h)

16

## Topics

* Classes
* Inheritance
* CSV
* JSON
* Working with Files
* Single Responsibility Principle
* Open-Closed Principle
* Dependency Inversion Principle

## Requirements

1. Get `.csv` file from [data.csv.zip](./assets/data.csv.zip).
2. The APP must provide the following functionality with `Single Responsibility Principle`:
   * `generate_report` such as:
     * `first_report`: Output the companies that have more or equal to 100 employees;
     * `second_report`: Output for all industries the number of companies that do them;
     * `third_report`: Output a list of the top 10 companies in New York by revenue, sorted in ascending order;
   * `export_report` in `.json` file
3. The APP must provide the following functionality with `Open-Closed Principle`:
   * Add the ability to export reports not only in `.json` file, but also in `.csv` file.
4. The APP must provide the following functionality with `Dependency Inversion Principle`:
   * Based on your knowledge of OOP principles, do a code check of your console application and correct non-compliance
     with this principle.

**Example:**

* Input:

`ruby business_reporting.rb first_report`

* Output:

  * for `.json`:

  ```json
    {
      "report": {
        "name": "Companies with more than or exactly 100 employees",
        "data": [
          {
            "id": 42940,
            "rank": 1,
            "workers": 218,
            "company": "Loot Crate",
            "url": "loot-crate",
            "state_l": "California",
            "state_s": "CA",
            "city": "Los Angeles",
            "growth": 66788.5962,
            "revenue": 116247698,
            "ifmid": 2,
            "ifiid": 4,
            "metro": "Los Angeles",
            "industry": "Consumer Products & Services",
            "yrs_on_list": 1
          },
          {
            "id": 42941,
            "rank": 2,
            "workers": 100,
            "company": "Paint Nite",
            "url": "paint-nite",
            "state_l": "Massachusetts",
            "state_s": "MA",
            "city": "Somerville",
            "growth": 36555.2472,
            "revenue": 55018793,
            "ifmid": 6,
            "ifiid": 4,
            "metro": "Boston",
            "industry": "Consumer Products & Services",
            "yrs_on_list": 1
          }
        ]
      }
    }
  ```

  * for `.csv`:

| id    | rank | workers | company    | url        | state_l       | state_s | city        | growth     | revenue   | ifmid | ifiid | metro       | industry                     | yrs_on_list |
|-------|------|---------|------------|------------|---------------|---------|-------------|------------|-----------|-------|-------|-------------|------------------------------|-------------|
| 42940 | 1    | 218     | Loot Crate | loot-crate | California    | CA      | Los Angeles | 66788.5962 | 116247698 | 2     | 4     | Los Angeles | Consumer Products & Services | 1           |
| 42941 | 2    | 100     | Paint Nite | paint-nite | Massachusetts | MA      | Somerville  | 36555.2472 | 55018793  | 6     | 4     | Boston      | Consumer Products & Services | 1           |

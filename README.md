# stock-trading-strategy-matlab

%%%%%%%%%%%%%%%%%%%%%%%%%%%%The dataset is not included. You can use your own stock price data in the same format.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

In this project I worked with stock price data and tried to build a very simple trading strategy.

I selected one stock and one year of data. Then I filtered the data and fixed missing values (NaN) manually by using neighbor values (average of previous and next value).

After cleaning the data, I calculated mean and standard deviation without using built-in functions.

## Strategy

I used a very simple rule based strategy:

- If price < (mean - std) → BUY
- If price > (mean + std) → SELL

Steps of the strategy:

1. Start with 100 TL cash and 0 stock
2. Check price for each day
3. If price is low (below mean - std), buy stock with all cash
4. If price is high (above mean + std), sell all stock
5. Continue this for all data
6. At the end calculate final value (cash + remaining stock)

## What I did in code

- Read data from Excel file
- Converted dates to datetime format
- Filtered data for specific year
- Cleaned NaN values manually (no function)
- Calculated mean and standard deviation manually
- Used for loop to simulate trading decisions

## Result

At the end I calculated the final value after applying the strategy.

## Note

This is just a basic project for practice. Strategy is very simple and not realistic.

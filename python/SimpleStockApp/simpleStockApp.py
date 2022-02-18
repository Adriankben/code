import streamlit as st
import yfinance as yf

st.write(' # Simple Stock Price App')

# Prompt user for ticker
tickerSymbol = st.text_input('Ticker Symbol')
st.write("You entered the ticker: ", tickerSymbol)

option = st.selectbox(
    'What time period would you like to view?',
    ('max', 'ytd', '10y', '5y', '2y', '1y', '6mo', '3mo', '1mo', '5d', '1d'))

if tickerSymbol == "":
    st.info('Please enter a ticker to begin.')

else:
    st.info('Ticker has been entered.')
    # get data on this ticker
    tickerData = yf.Ticker(tickerSymbol)
    # get the historical prices for this ticker
    tickerDf = tickerData.history(period=option)
    # Open	High	Low	Close	Volume	Dividends	Stock Splits

    st.write('You selected:', option)

    st.write(""" ### Open Price """)
    st.line_chart(tickerDf.Open)

    st.write(""" ### Closing Price """)
    st.line_chart(tickerDf.Close)

    st.write(""" ### Volume Price """)
    st.line_chart(tickerDf.Volume)

    st.write(" ### Company Information")

    # st.write(": ", tickerData.info[''])
    imageUrl = "![Ticker Logo](" + tickerData.info['logo_url'] + ")"

    st.markdown(imageUrl)

    st.write("Name: ", tickerData.info['shortName'])

    # Get full address
    st.write("Address: ", tickerData.info['address1'], ", ", tickerData.info['city'], ", ", tickerData.info['state'],
             ", ", tickerData.info['zip'])
    st.write("Sector: ", tickerData.info['sector'], " ", "Industry: ", tickerData.info['industry'], )

    st.write(tickerData.info['longBusinessSummary'])
    # create 4 columns
    col1, col2, col3, col4 = st.columns(4)

    with col1:
        st.write("Current Price: ", tickerData.info['currentPrice'])
        st.write("Profit Margins: ", tickerData.info['profitMargins'])
        st.write("52 Week High: ", tickerData.info['fiftyTwoWeekHigh'])
        st.write("Trailing P/E: ", tickerData.info['trailingPE'])

    with col2:
        st.write("Target Low Price: ", tickerData.info['targetLowPrice'])
        st.write("EBITDA Margins: ", tickerData.info['ebitdaMargins'])
        st.write("52 Week Low: ", tickerData.info['fiftyTwoWeekLow'])
        st.write("Forward P/E: ", tickerData.info['forwardPE'])

    with col3:
        st.write("Recommendation: ", tickerData.info['recommendationKey'])
        st.write("Current Ratio: ", tickerData.info['currentRatio'])
        st.write("Return On Assets: ", tickerData.info['returnOnAssets'])
        st.write("Debt To Equity: ", tickerData.info['debtToEquity'])

    with col4:
        st.write("Price To Book: ", tickerData.info['priceToBook'])

    # show financials
    st.write(""" ### Financials""")

    st.write(""" #### Yearly """)
    st.write(tickerData.financials)
    st.write(""" #### Quarterly """)
    st.write(tickerData.quarterly_financials)

    # show balance sheet
    st.write(" ### Balance Sheets")

    st.write(""" #### Yearly """)
    st.write(tickerData.balance_sheet)
    st.write(""" #### Quarterly """)
    st.write(tickerData.quarterly_balance_sheet)

    # show cashflow
    st.write(" ### Cashflow")

    st.write(""" #### Yearly """)
    st.write(tickerData.cashflow)
    st.write(""" #### Quarterly """)
    st.write(tickerData.quarterly_cashflow)

    # show earnings
    st.write(" ### Earnings")

    st.write(""" #### Annual""")
    st.write(tickerData.earnings)
    st.write(""" #### Quarterly """)
    st.write(tickerData.quarterly_earnings)

    # get event data for ticker
    st.write(""" ### Calendar Price """)
    st.write(tickerData.calendar)

import os


def closeFile():

    try:
        os.system('TASKKILL /F /IM EXCEL.EXE')

    except Exception:
        print("No file to close")

def close_browserwindow(driver):
    if driver=="chrome":
         try:
             os.system('TASKKILL /F /IM chrome.exe')
         except Exception:
              print("No Browser to close")
    elif  driver=="ff":
          try:
             os.system('TASKKILL /F /IM firefox.exe')
          except Exception:
              print("No Browser to close")

    elif driver == "chrome":

        try:

            os.system('TASKKILL /F /IM chromedriver.exe')

        except Exception:

            print("No Browser to close")



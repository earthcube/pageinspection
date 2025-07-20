from baml_client.sync_client import b
from baml_client.types import Page, Links
import asyncio
from crawl4ai import *

def read_text_file(filepath):
  try:
    with open(filepath, 'r') as file:
      content = file.read()
    return content
  except FileNotFoundError:
    print(f"Error: File not found at '{filepath}'")
    return None
  except Exception as e:
    print(f"An error occurred: {e}")
    return None


def example4Page(mdtext: str) -> Page:
  response = b.ExtractPage(mdtext)
  return response

def example4Datapage(mdtext: str) -> Links:
  response = b.ExtractDataset(mdtext)
  return response

# This one doesn't seem to work?   Not building stream code version??
# def example_stream(raw_resume: str) -> Page:
#   stream = b.stream.ExtractPage(raw_resume)
#   for msg in stream:
#     print(msg)  

#   final = stream.get_final_response()

#   return final

async def main():
# testfile = read_text_file("./testdata/page1.md")
# r = example(testfile)
# print(r.model_dump_json(indent=2))

  async with AsyncWebCrawler() as crawler:
      result = await crawler.arun(
          # url="https://www.waterqualitydata.us"
          url="https://www.hydrosheds.org/hydrosheds-core-downloads",
      )
      # print(result.markdown)
  # r = example4Page(result.markdown)  # or example4Datapage
  r = example4Datapage(result.markdown)

  print("----------------")
  print(r.model_dump_json(indent=2))

  print("----------------")
  print(r.model_dump())

if __name__ == "__main__":
    asyncio.run(main())


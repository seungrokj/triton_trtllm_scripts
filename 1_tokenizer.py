import transformers
from transformers import AutoTokenizer
import argparse
parser = argparse.ArgumentParser(description='')
parser.add_argument("--model",
                    type=str,
                    help="hf_model name")
args = parser.parse_args()

tokenizer = AutoTokenizer.from_pretrained(args.model)
tokenizer.save_pretrained("./tokenizer/")

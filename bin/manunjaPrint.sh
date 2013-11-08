#!/bin/sh



file=$1

scp $1 manunja:

ssh -X manunja evince $1



def has_duplicates(nums):
    seen = set(nums)
    if len(seen) == len(nums):
        return False
    else:
        return True


nums = [1, 2, 3, 4, 5, 1]
print(has_duplicates(nums))

nums = [1, 2, 3, 4, 5]
print(has_duplicates(nums))

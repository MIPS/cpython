import functools
import unittest.runner


class NoDescriptionsRunner(unittest.runner.TextTestRunner):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.descriptions = False


main = functools.partial(unittest.main, testRunner=NoDescriptionsRunner)
"""
Customized version of unittest.main that disables "descriptions".
Ref bpo-46126.
"""

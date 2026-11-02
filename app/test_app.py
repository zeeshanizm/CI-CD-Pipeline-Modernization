import unittest
from app import app
class Tests(unittest.TestCase):
    def test_health(self):
        response = app.test_client().get('/healthz')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json['status'], 'healthy')
if __name__ == '__main__': unittest.main()

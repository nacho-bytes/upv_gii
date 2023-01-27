import QueueList
main = do
   putStrLn (show (dequeue (enqueue 1 empty)))
   putStrLn (show (enqueue 10 (enqueue 5 empty)))
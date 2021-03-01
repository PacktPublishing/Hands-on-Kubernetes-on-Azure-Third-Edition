from azure.storage.queue import (
        QueueClient,
        BinaryBase64EncodePolicy,
        BinaryBase64DecodePolicy
)
import os, uuid

connect_str="<your storage connection string>"
queue_client = QueueClient.from_connection_string(connect_str, "function")

for i in range(1, 1000):
    message = "Message " + str(i)
    print("Adding message: " + str(i))
    queue_client.send_message(message)
<?php
session_start();
include 'db.php';

// Create messages table if it doesn't exist
$sql = "CREATE TABLE IF NOT EXISTS chat_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender VARCHAR(50) NOT NULL,
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";
$conn->query($sql);

// Handle sending messages
if ($_POST['action'] === 'send') {
    $sender = $_POST['sender'];
    $message = $_POST['message'];
    
    $stmt = $conn->prepare("INSERT INTO chat_messages (sender, message) VALUES (?, ?)");
    $stmt->bind_param("ss", $sender, $message);
    $stmt->execute();
    $stmt->close();
    
    echo json_encode(['success' => true]);
    exit;
}

// Handle fetching messages
if ($_POST['action'] === 'fetch') {
    $stmt = $conn->prepare("SELECT * FROM chat_messages ORDER BY timestamp DESC LIMIT 50");
    $stmt->execute();
    $result = $stmt->get_result();
    
    $messages = [];
    while ($row = $result->fetch_assoc()) {
        $messages[] = $row;
    }
    
    echo json_encode($messages);
    exit;
}
?>

function showAlert() {
    if (confirm('Are you sure you want to report this post??')) {
        window.location.href='./report.html'
  // Save it!
  console.log('Action progressed');
} else {
  console.log('Action incompleted');
  }
}
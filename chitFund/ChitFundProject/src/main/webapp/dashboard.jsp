<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChitFund Management Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- Custom Styles -->
    <style>
    
        body {
            font-family: 'Roboto', sans-serif;
            background: url('https://cdn.pixabay.com/photo/2018/03/21/16/18/investment-3247252_640.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #ffffff;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        /* Top Banner */
        .top-banner {
            background-color: rgba(0, 0, 0, 0.8);
            width: 100%;
            text-align: center;
            padding: 15px 0;
            font-size: 28px;
            font-weight: bold;
            color: #FFD700;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.3);
            text-transform: uppercase;
            letter-spacing: 2px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        /* Sidebar Navigation */
        .menu-bar {
            background-color: rgba(0, 0, 0, 0.8);
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 60px;
            left: 0;
            display: flex;
            flex-direction: column;
            padding: 20px;
        }

        .menu-bar a {
            color: #ffffff;
            margin: 15px 0;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            transition: color 0.3s, transform 0.3s;
        }

        .menu-bar a:hover {
            color: #FFD700;
            text-decoration: underline;
            transform: scale(1.1);
        }

        /* Main Content Wrapper */
        .content-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            width: calc(100% - 250px);
            min-height: 100vh;
            margin-left: 250px;
            padding-top: 80px;
        }

        /* Content for Dashboard */
        .container {
            width: 60%;
            background: rgba(0, 0, 0, 0.6);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h2 {
            color: #FFD700;
            font-weight: 700;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }

        .select-box {
            width: 400px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            margin: auto;
        }

        .select-box select {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border-radius: 10px;
            border: 2px solid #FFD700;
            background-color: #ffffff;
            color: #000;
            font-weight: bold;
        }

        .btn-success {
            background-color: #28a745;
            padding: 12px;
            border-radius: 10px;
            font-size: 18px;
            width: 100%;
            margin-top: 15px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.3s;
        }

        .btn-success:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        /* Content for Why Us Section */
        .content-container {
            max-width: 900px;
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .image-container img {
            width: 200px;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(255, 255, 255, 0.3);
        }

        .content {
            flex: 2;
            padding-left: 30px;
        }

        h1 {
            color: #FFD700;
            margin-bottom: 15px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            background: rgba(255, 255, 255, 0.2);
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #FFD700;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            margin-top: 15px;
            border-radius: 5px;
            color: black;
        }

        .btn-primary:hover {
            background-color: #d4af37;
        }

        /* Contact Us Section */
        .contact-container {
            max-width: 900px;
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            display: none;
        }

        .contact-container img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }

        .contact-content {
            padding-left: 30px;
        }

        .contact-container ul li {
            font-weight: bold;
        }

        @media (max-width: 992px) {
            .content-wrapper {
                flex-direction: column;
                margin-left: 0;
                width: 100%;
                padding-top: 100px;
            }
            .menu-bar {
                width: 100%;
                height: auto;
                position: relative;
                text-align: center;
            }
            .container {
                flex-direction: column;
                text-align: center;
                padding: 20px;
            }
            .content {
                padding-left: 0;
            }
        }
        
		/* Group Creation Form Container */
		.form-container {
    		margin-top: 350px; /* Adjust this value to set the space from the top */
    		background-color: rgba(0, 0, 0, 0.7); /* Adjust background for better visibility */
		    padding: 40px;
		    border-radius: 12px;
		    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
		    max-width: 750px;
		    width: 100%;
		    margin: 100px auto; /* Ensures it's centered and has space at the top */
		}

	@media (max-width: 768px) {
	    .form-container {
	        margin: 40px auto; /* Reduces the margin on smaller screens */
	        padding: 30px;
	    }
	}
		

        /* Button Styles */
        .btn-block {
            margin-top: 15px;
        }
    </style>
</head>
<body>

    <!-- Top Banner -->
    <div class="top-banner">
        Premier ChitFund Management System
    </div>

    <!-- Sidebar Menu -->
    <div class="menu-bar">
        <a href="javascript:void(0);" onclick="showCreategroup()">Create Chit Group</a>
        <a href="registerMember.html">Register Member</a>
        <a href="auction.html">Auction Menu</a>
        <a href="groupDetails.jsp">Available Chit Plans</a>
        <a href="onGoingChitPlans.html">On Going Chit Plans</a>
        <a href="javascript:void(0);" onclick="showWhyUs()">Why Us?</a>
        <a href="javascript:void(0);" onclick="showContactUs()">Contact Us</a>
        <a href="logut.jsp">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content-wrapper">
        <div class="container" id="dashboardContent" style="display: block;">
            <h2>Select a Chit Group</h2>
            <div class="select-box">
                <label for="groupSelect">Select Group:</label>
                <select id="groupSelect" class="form-control">
                    <option value="">-- Select Group --</option>
                    <%
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login_db", "root", "aravind");

                            String sql = "SELECT group_id, group_name FROM groupss";
                            stmt = conn.prepareStatement(sql);
                            rs = stmt.executeQuery();

                            while (rs.next()) {
                                int groupId = rs.getInt("group_id");
                                String groupName = rs.getString("group_name");
                    %>
                    <option value="<%= groupId %>"><%= groupName %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                </select>
                <button class="btn btn-success" onclick="viewMembers()">View All Members</button>
            </div>
        </div>
        
        <!-- Why Us Section -->
        <div class="content-container" id="whyUsContent" style="display: none;">
            <div class="image-container">
                <img src="https://img.freepik.com/premium-photo/business-man-holding-clipboard-with-why-choose-us-question_23-2148932310.jpg?semt=ais_hybrid" alt="Why Choose Us">
            </div>
            <div class="content">
                <h1>Why Choose Us?</h1>
                <p>We offer a reliable and transparent chit fund management system designed to help you invest and save smartly.</p>
                <ul>
                    <li>✔ Secure & Trusted Platform</li>
                    <li>✔ Hassle-Free Auctions & Management</li>
                    <li>✔ Flexible Chit Plans</li>
                    <li>✔ Transparent Transactions</li>
                    <li>✔ 24/7 Customer Support</li>
                </ul>
                <a href="dashboard.jsp" class="btn btn-primary">Back to Home</a>
            </div>
        </div>
        
        <!-- Contact Us Section -->
        <div class="contact-container" id="contactUsContent" style="dispaly: none;">
            <div class="image-container">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe6vlWG6nrpWI_gojT-usGx0_HFpY6tXnMfQ&s" alt="Contact Us">
            </div>
            <div class="contact-content">
                <h1>Contact Us</h1>
                <p>If you have any questions, feel free to reach out to us.</p>
                <p><strong>Email:</strong> support@chitfund.com</p>
                <p><strong>Phone:</strong> +91 8367630193</p>
                <p><strong>Address:</strong> Hyderabad, Telangana, India, 500097</p>
                <a href="dashboard.jsp" class="btn btn-primary">Back to Home</a>
            </div>
        </div>
    
    
        <!-- Group Creation Form -->
    <div class="form-container mt-80px" id="createGroupContent" style="display: none;">
        <h1 class="text-center mb-4">Create Group</h1>
        <form id="groupForm" action="CreateGroupServlet" method="post">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="groupName">Group Name:</label>
                    <input type="text" class="form-control" id="groupName" name="groupName" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="groupAmount">Amount per Member:</label>
                    <input type="number" class="form-control" id="groupAmount" name="groupAmount" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="contributionFrequency">Contribution Frequency:</label>
                    <select class="form-control" id="contributionFrequency" name="contributionFrequency" required>
                        <option value="monthly">Monthly</option>
                        <option value="bi-weekly">Bi-weekly</option>
                        <option value="weekly">Weekly</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="startMonth">Start Month:</label>
                    <input type="month" class="form-control" id="startMonth" name="startMonth" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="endMonth">End Month:</label>
                    <input type="month" class="form-control" id="endMonth" name="endMonth" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="interestPenalty">Interest/Penalty on late payment:</label>
                    <input type="number" class="form-control" id="interestPenalty" name="interestPenalty" step="0.01">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="prizeMethod">Prize Distribution Method:</label>
                    <select class="form-control" id="prizeMethod" name="prizeMethod" required>
                        <option value="lottery">Lottery</option>
                        <option value="rotating">Rotating</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="securityDeposit">Security Deposit (Optional):</label>
                    <input type="number" class="form-control" id="securityDeposit" name="securityDeposit" step="0.01">
                </div>
            </div>
            <div class="form-group">
                <label for="description">Description (Optional):</label>
                <textarea class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="termsAndConditions" name="termsAndConditions" required>
                <label class="form-check-label" for="termsAndConditions">I agree to the terms and conditions</label>
            </div>
            <button type="submit" class="btn btn-success btn-block">Create Group</button>
            <div class="text-center mt-3">
                <a href="dashboard.jsp" class="btn btn-warning btn-block">Back to Home</a>
            </div>
        </form>
    </div>
    
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function viewMembers() {
            var selectedGroup = document.getElementById("groupSelect").value;
            if (selectedGroup === "") {
                alert("Please select a group to view members.");
                return;
            }
            window.location.href = "viewMembers.jsp?groupId=" + selectedGroup;
        }

        function showWhyUs() {
            // Hide sections and display "Why Us" content
    		hideAllSections();
    		document.getElementById("whyUsContent").style.display = "flex";

            
            
            // Update background
            document.body.style.backgroundImage = "url('https://www.evlateam.co.uk/wp-content/uploads/2017/10/why-choose-us-background.png')";
            document.body.style.backgroundSize = "cover";
            document.body.style.backgroundPosition = "center center";
        }

        function showContactUs() {
            // Hide sections and display "Contact Us" content
			hideAllSections();
            document.getElementById("contactUsContent").style.display = "block";
            
            // Update background
            document.body.style.backgroundImage = "url('https://www.evlateam.co.uk/wp-content/uploads/2017/10/why-choose-us-background.png')";
            document.body.style.backgroundSize = "cover";
            document.body.style.backgroundPosition = "center center";
        }
        
        function showCreategroup() {
            // Hide sections and display "Contact Us" content
            hideAllSections();
            document.getElementById("createGroupContent").style.display = "block";
            
            // Update background
            document.body.style.backgroundImage = "url('https://www.evlateam.co.uk/wp-content/uploads/2017/10/why-choose-us-background.png')";
            document.body.style.backgroundSize = "cover";
            document.body.style.backgroundPosition = "center center";
        }
        function hideAllSections() {
            document.getElementById("dashboardContent").style.display = "none";
            document.getElementById("whyUsContent").style.display = "none";
            document.getElementById("contactUsContent").style.display = "none";
            document.getElementById("createGroupContent").style.display = "none";
        }
    </script>
</body>
</html>




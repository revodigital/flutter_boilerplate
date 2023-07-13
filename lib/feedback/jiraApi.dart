import 'package:atlassian_apis/jira_platform.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'jiraInstance.dart';

class JiraClient {
  JiraInstance? _instance;
  JiraInstance? get instance => _instance;

  JiraInstance _init() {
    _instance ??= _createInstance();

    return _instance!;
  }

  JiraInstance? _createInstance() {
    var user = dotenv.env['ATLASSIAN_USER']!;
    var apiToken = dotenv.env['ATLASSIAN_API_TOKEN']!;

    var client = ApiClient.basicAuthentication(
        Uri.https('${dotenv.env["ATLASSIAN_URL"]}', ''),
        user: user,
        apiToken: apiToken,
    );

    var jira = JiraPlatformApi(client);

    return JiraInstance(client, jira);
  }

  Future<CreatedIssue> createFeedback(String description) async {
    var jira = _init().platformApi;

    return await jira.issues.createIssue(body: IssueUpdateDetails(
      fields: {
        "summary": "${dotenv.env["TEST_ENV"] == "true" ? "Test " : ""}Feedback-${DateTime.now()}",
        "issuetype": {
          "id": dotenv.env["ATLASSIAN_FEEDBACK_ID"]
        },
        "project": {
          "id": dotenv.env["ATLASSIAN_PROJECT_ID"]
        },
        "description": {
          "type": "doc",
          "version": 1,
          "content": [
            {
              "type": "paragraph",
              "content": [
                {
                  "text": description,
                  "type": "text"
                }
              ]
            }
          ]
        },
        "customfield_10020": int.parse(dotenv.env["ATLASSIAN_BOARD_ID"]!),
        "reporter": {
          "id": dotenv.env["ATLASSIAN_REPORTER_ID"]
        }
      }
    ));
  }

  Future<List<Attachment>> uploadScreenshot(String issueId, MultipartFile uri) async {
    var jira = _init().platformApi;

    return await jira.issueAttachments.addAttachment(issueIdOrKey: issueId, file: uri);
  }
}
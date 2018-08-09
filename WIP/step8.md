If you have not not yet made entries in the Guestbook, go ahead and do so now. The **Guestbook** tab is right next to the **Kibana** tab at the top of the terminal.

Launch Kibana by clicking on the **Kibana** tab at the top of your terminal. 

#### Configure Defaults
You should now have indices for Filebeat and Metricbeat in Elasticsearch.   In order to use Kibana to search and visualize the information in those indices you have to set one of the patterns **filebeat-\*** or **metricbeat-\*** as the default.  Click on **Management** and then **Index Patterns**.

![abc](https://user-images.githubusercontent.com/25182304/43741865-d552ac5a-999d-11e8-9c27-3ce5ef38ecc8.png)

Choose one of the patterns by clicking on it.  I generally set **metricbeat-\*** as the default, so that is what the screenshots will show.

![ghi](https://user-images.githubusercontent.com/25182304/43741879-de52cb28-999d-11e8-9d2d-02f8cb965e38.png)

Click the stat on the far right of the page to make your index pattern the default

![mno](https://user-images.githubusercontent.com/25182304/43741884-e1462d84-999d-11e8-9977-45ae5a2975da.png)

Select yes or no to share basic usage information with Elastic

![stu](https://user-images.githubusercontent.com/25182304/43741889-e78c71e4-999d-11e8-8d4a-830c752cf136.png)


#### Explore Data

If you made entries in the Guestbook earlier in the demo, you should be able to see these in the Kibana Discover app, and in the [Filebeat Apache2] Access and Error Logs dashboard. The Guestbook application relies on Redis to store data, so the Redis dashboards will also have data.

- [Apache Dashboards](https://[[HOST_SUBDOMAIN]]-30601-[[KATACODA_HOST]].environments.katacoda.com/app/kibana#/dashboards?filter=apache)
- [Apache Saved Search](https://[[HOST_SUBDOMAIN]]-30601-[[KATACODA_HOST]].environments.katacoda.com/app/kibana#/discover/Apache2-access-logs)
- [Redis Dashboards](https://[[HOST_SUBDOMAIN]]-30601-[[KATACODA_HOST]].environments.katacoda.com/app/kibana#/dashboards?notFound=dashboard&filter=redis)
- [Kibana](https://[[HOST_SUBDOMAIN]]-30601-[[KATACODA_HOST]].environments.katacoda.com/app/kibana)

// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
package org.apache.cloudstack.api.command.user.resource;

import java.util.ArrayList;
import java.util.List;

import org.apache.cloudstack.api.APICommand;
import org.apache.cloudstack.api.ApiConstants;
import org.apache.cloudstack.api.BaseListProjectAndAccountResourcesCmd;
import org.apache.cloudstack.api.Parameter;
import org.apache.cloudstack.api.response.ListResponse;
import org.apache.cloudstack.api.response.ResourceLimitResponse;
import org.apache.log4j.Logger;

import com.cloud.configuration.ResourceLimit;
import com.cloud.configuration.Resource.ResourceOwnerType;

@APICommand(name = "listResourceLimits", description="Lists resource limits.", responseObject=ResourceLimitResponse.class)
public class ListResourceLimitsCmd extends BaseListProjectAndAccountResourcesCmd {
    public static final Logger s_logger = Logger.getLogger(ListResourceLimitsCmd.class.getName());

    private static final String s_name = "listresourcelimitsresponse";

    /////////////////////////////////////////////////////
    //////////////// API parameters /////////////////////
    /////////////////////////////////////////////////////

    @Parameter(name=ApiConstants.ID, type=CommandType.LONG, description="list resource limits by ID.")
    private Long id;

    @Parameter(name=ApiConstants.RESOURCE_TYPE, type=CommandType.INTEGER, description="list resource limits by type. Values are 0 to 11 as follows." +
    		                                                                            "0 - Instance. Limit value for instances (virtual machines). " +
                                                                                        "1 - IP. Limit for public IP addresses. " +
                                                                                        "2 - Volume. Limit for disk volumes. " +
                                                                                        "3 - Snapshot. Limit for snapshots. " +
                                                                                        "4 - Template. Limit for templates. " +
                                                                                        "5 - Project. Limit for projects. " +
                                                                                        "6 - Network. Limit for networks. " +
                                                                                        "7 - VPC. Limit for VPCs. " +
                                                                                        "8 - CPU. Limit for CPUs allocated to VMs. " +
                                                                                        "9 - Memory. Limit for RAM (in MB) allocated to VMs. " +
                                                                                        "10 - Primary Storage. Limit for Primary storage (in GB) allocated to VMs. " +
                                                                                        "11 - Secondary Storage. Limit for Secondary storage (in GB).")
    private Integer resourceType;

    /////////////////////////////////////////////////////
    /////////////////// Accessors ///////////////////////
    /////////////////////////////////////////////////////

    public Long getId() {
        return id;
    }

    public Integer getResourceType() {
        return resourceType;
    }

    /////////////////////////////////////////////////////
    /////////////// API Implementation///////////////////
    /////////////////////////////////////////////////////

    @Override
    public String getCommandName() {
        return s_name;
    }

    @Override
    public void execute(){
        List<? extends ResourceLimit> result = _resourceLimitService.searchForLimits(id, finalyzeAccountId(this.getAccountName(), this.getDomainId(), this.getProjectId(), false), this.getDomainId(), resourceType, this.getStartIndex(), this.getPageSizeVal());
        ListResponse<ResourceLimitResponse> response = new ListResponse<ResourceLimitResponse>();
        List<ResourceLimitResponse> limitResponses = new ArrayList<ResourceLimitResponse>();
        for (ResourceLimit limit : result) {
            ResourceLimitResponse resourceLimitResponse = _responseGenerator.createResourceLimitResponse(limit);
            resourceLimitResponse.setObjectName("resourcelimit");
            limitResponses.add(resourceLimitResponse);
        }

        response.setResponses(limitResponses);
        response.setResponseName(getCommandName());
        this.setResponseObject(response);
    }
}

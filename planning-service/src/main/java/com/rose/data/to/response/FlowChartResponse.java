package com.rose.data.to.response;

import lombok.Data;

import java.util.List;

//{
//        'name': 'Lao Lao',
//        'content': 'general manager',
//        'children': [
//            {'name': 'Bo Miao','content': 'department manager'},
//            {
//                'name': 'Su Miao',
//                'content': 'department manager',
//                'children': [{
//                    'name': 'Tie Hua',
//                    'content': 'senior engineer'
//                },{
//                    'name': 'Hei Hei',
//                    'content': 'senior engineer',
//                    'children': [{
//                        'name': 'Pang Pang',
//                        'content': 'engineer'
//                    },{
//                        'name': 'Xiang Xiang',
//                        'content': 'UE engineer'
//                    }]
//                }]
//            },
//            {'name': 'Yu Jie','content': 'department manager'}
//        ]
//}
@Data
public class FlowChartResponse {
    private String name;
    private String content;
    private List<FlowChartResponse> children;
}
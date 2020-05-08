package com.rose.data.to.response;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

//{
//        'name': 'Lao Lao',
//        'title': 'general manager',
//        'children': [
//            {'name': 'Bo Miao','title': 'department manager'},
//            {
//                'name': 'Su Miao',
//                'title': 'department manager',
//                'children': [{
//                    'name': 'Tie Hua',
//                    'title': 'senior engineer'
//                },{
//                    'name': 'Hei Hei',
//                    'title': 'senior engineer',
//                    'children': [{
//                        'name': 'Pang Pang',
//                        'title': 'engineer'
//                    },{
//                        'name': 'Xiang Xiang',
//                        'title': 'UE engineer'
//                    }]
//                }]
//            },
//            {'name': 'Yu Jie','title': 'department manager'}
//        ]
//}
@Data
public class FlowChartResponse {
    private String name;
    private String title;
    private List<FlowChartResponse> children;
}
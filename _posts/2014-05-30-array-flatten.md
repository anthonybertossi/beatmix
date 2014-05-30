---
layout: defaultpadded
title: "Flatten array in PHP"
slug: posts
back: posts.html
date: 2014-05-30 07:44:20 +0200
categories:
  - development
  - php
---
{% highlight php %}
<?php
/**
 * @param $array array() Array to flatten
 * @param $preserveParentInKey string if NULL, array will be flatten without keep parent key
 * @param $separator string default /
 * @param $preserveKeys int Preserve key or not (return associativ if 1)
 * @example 
 *         $arr = array();
 *             'submitted' => array(
 *                 'date' => date('Y-m-d'),
 *                 'firstname' => 'Thierry',
 *                 'lastname' => 'POINOT',
 *             ),
 *             'details' => array(
 *                 'nid' => 25,
 *                 'sid' => 2,
 *             ),
 *             'other' => true,
 *         );
 *         $flattenizeArray = array_flatten($arr, '', '--')
 *         // $flattenizeArray return : 
 *         // array(
 *         //     'submitted--date' => '2014-05-17',
 *         //     'submitted--firstname' => 'Thierry',
 *         //     'submitted--lastname' => 'POINOT',
 *         //     'details--nid' => 25,
 *         //     'details--sid' => 2,
 *         //     'other' => true,
 *         // )
 *         $flattenizeArray2 = array_flatten($arr, '', '|')
 *         // $flattenizeArray return : 
 *         // array(
 *         //     'submitted|date' => '2014-05-17',
 *         //     'submitted|firstname' => 'Thierry',
 *         //     'submitted|lastname' => 'POINOT',
 *         //     'details|nid' => 25,
 *         //     'details|sid' => 2,
 *         //     'other' => true,
 *         // )
 */
function array_flatten($array, $preserveParentInKey = NULL, $separator = '/', $preserveKeys = 1, $newArray = Array()) {
    foreach ($array as $key => $child) {
        if (is_array($child)) {
            if ($preserveParentInKey === NULL) {
                $newArray = array_flatten($child, $preserveParentInKey, $separator, $preserveKeys, $newArray);
            }
            else {
                if ($preserveParentInKey !== '') {
                    $newArray = array_flatten($child, $preserveParentInKey. $separator .$key, $separator, $preserveKeys, $newArray);
                }
                else {
                    $newArray = array_flatten($child, $key, $separator, $preserveKeys, $newArray);
                }
            }
        } elseif ($preserveKeys + is_string($key) > 1) {
            if ($preserveParentInKey !== '') {
                $newArray[$preserveParentInKey. $separator .$key] = $child;
            }
            else {
                $newArray[$key] = $child;
            }
        } else {
            $newArray[] = $child;
        }
    }
    // sort($newArray);
    return $newArray;
}
?>
{% endhighlight %}

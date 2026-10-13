Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F59524AEF
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910137; cv=none; b=qBCjLvNS1Tdyx98BB5+viZSREiuZBr12Vg/UAN/cfyujrEVDPzmmt8fgEgahsf6keLjGiDC/UhE9e0cv6EusLbq2FZaI3jb33QvHNzJj2h0h3kOY/p4xZY+eiESgvo2BaZkOJsj3iFeTVESLKMuib48iwQriDiKGOh+Z+WxeAks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910137; c=relaxed/simple;
	bh=wfXYcxBUcTdkEAfVqMYgLd40XfjKpjEq8JpUHlnvryQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIYNLgci//YCusb3erJrJdODHfIqulazRCzCNr97d6uo1CD5BsKgFif9+UXdRiZghmpjBDN56Q1Haq0nlhlj/YOhDmf1+ANqrUeAIZvuLE15VZqZ9ULMWuP7MxD1hso2pqsaJCEFK8c1rUjzpIJQbPGxktYjrmK+WJqRJVm2JDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=hefqC7JP; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ttbfix0m; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="hefqC7JP";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ttbfix0m"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DGY4vN4135393
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 12:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fqnh
	mGiFYREgWzQ661rb4bCN5SeACDTG22KgE4Jv5Dg=; b=hefqC7JPUhIOkuMn8GZl
	g7CaTNm3d7MgAuKshB7xEH4jUQL3Y5fYCovCEQ9QORRAyUUoShBXGLMwpqOWgkIx
	Skb8QKoNwr5qhqUhWAXR84qcmywPWPHFEgb0qDPquVpD9tSkMswBBs+lF1oTKm27
	OBeM9PyLx8/Z5JhtwVYBMHLhOz044kB1PxFDR3P6ZM2sfHQU8xLmnVp7w/O/wkqs
	hg3jrY0+LFGHoKNqpRyX65O2dWuEZLwVlwepSL1osBsw8xVk9RmuOUS+zZWHIDvJ
	X6upshbOxE4zvSUCuhGUOAgdFUm8kKJ4oZhwWOzNBYQnypjNZFAWxLogQauuobbf
	ow==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h9qy7raxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 12:48:52 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9197553d398so74200256d6.1
        for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 09:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791910132; x=1792514932; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqnhmGiFYREgWzQ661rb4bCN5SeACDTG22KgE4Jv5Dg=;
        b=ttbfix0ma+JzZXXSb6JMndGUmUe13pvUwhdR/YAlNaNnqvO//ghUgBC4QHwwexS1Le
         0ClKHaHr9FKm2B7+JWOABV560nhUkuVl9Wz5B3GNAuc9qmLXpAq8ff+6DYqyAJcdE7cl
         +bo+PWZKoBDzdlzBF8xgWnnsdApbPJbVeYpyvxxC+V+ABLjaMQr2c3uO3ssAny2ysNw8
         E4iVBl2OqydK2ywu9B9k6SRY4/S+vD4ODigZDozb1VQZPDB44mdu/CC7ID+Z9Ke+L7Lt
         Qqtdw7SPD/v7Kvxuzf3/t73mGOnuAnsSjcJdpaBe8QBwm4sBLfe7Gi1w8gjPcHFEqWH0
         Vduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910132; x=1792514932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqnhmGiFYREgWzQ661rb4bCN5SeACDTG22KgE4Jv5Dg=;
        b=2EM7l7UmtCltDMrcX6smIPstt1XVvOKDMKBIKbVEudmYz9Io+CkNcf+n46ymhGDjAM
         CkLG5MwvCpmSuyoZMgt9hLPNKaR1xhppAlC6iBe60DNK4lNkNiFtGZDG/KA6j5SOKPF5
         YHzKaYzI2eztZdW1FoLjcqONbKhIEfvsXOJmnERc5h3BRBYXxzQQar1wUCDTuCmWJDrm
         imXPDOuAif3ilkxxNU38Ah6OzfzcardomjUfdSkJpECiEV6WD/JKDJKaQ5GpYIKsmES1
         pxSU8acRDtvR11THIw9NaW8wIgAdQNBiOmeHiTaPA75vmwpoCmIssU+1DnhnJEhoYnNQ
         eWow==
X-Forwarded-Encrypted: i=1; AKwUvBy7N0LIf61eQnM8fLYl2x6W/W6W9Sk+eC4CtscomQPU2P+xdWDUfQNSdTuU0xH7Qiil2PacR5mEKCpD@lists.linux.dev
X-Gm-Message-State: AFq9FYK3PjYCnyqDK8VrI8NnmxTvH7ajwrKmH8QMgP22g9xD9eMYiTFs
	W48FjIoH6Lo5zCI4iOZx4UwOD9ruzmQS8qpB0ng3DsNx14H9RCskbwUYdJicVTmDmQaPIkV+qKe
	ahgPq/NYK642f/YpdOp1TKGr46ACEOnSY/UIMBBQrAF8cGG0CihB2egXpWLA=
X-Gm-Gg: AYBFou19+VWIgYlAY0J93CWuZUYacpFRJ6VomsaHhz6p+3lJZd+HTsEjitwu0dDfTfr
	61CFDMjYtgEW08d0Zp0hAgUjBvQ2gez8sUWOeow0xjkFdilb2kFj34HKSdJtulWRW4atsLsIgbR
	SPpI03kl8hlTRw88GkJziRm5H/0j0HEJI555pfxNJDw7gndGaoeAbcEpwYCn68vX8iB1qFAIKpk
	qfVCQuAhHwsqL4BJkden/KITYzixkahd1kucID0YE9TnPbwPg16KB6g5m6uG2muGsWW9EguWt7Q
	Rn6JaIVbcgJ6aoAyBKz3j+L2U13AsvQv4PGqhnxDjzM0GyiOjn78WHYmR2lBUafGV03sjLUdqn8
	OaRRR7m8LpOaz93jnTLeh58vjQILaAl3J4ro5Jml5KHWopw==
X-Received: by 2002:a05:6214:4893:b0:91b:7601:342b with SMTP id 6a1803df08f44-91b76013458mr137818686d6.49.1791910132201;
        Tue, 13 Oct 2026 09:48:52 -0700 (PDT)
X-Received: by 2002:a05:6214:4893:b0:91b:7601:342b with SMTP id 6a1803df08f44-91b76013458mr137818246d6.49.1791910131585;
        Tue, 13 Oct 2026 09:48:51 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-177-43.net.columbia.edu. [128.59.177.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b62240sm29626596d6.23.2026.10.13.09.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 09:48:51 -0700 (PDT)
Message-ID: <3dfb90b9-e1d6-4a0d-899f-5db3160cb31b@columbia.edu>
Date: Tue, 13 Oct 2026 12:48:50 -0400
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fuse: convert the readdir cache to use folios
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2NSBTYWx0ZWRfX+K5pSKys/eQ4
 nRMRs1U3mxSVqLtsnb7G7+SchW5+s2kFHXnN0BT7/wl6Z5PsGZmUQnbkrS66SPvVcrxoNStg+6i
 0Q/wpvrv58CmvVYeUApfZJ4Ajwka56rrz5hYLhd69iEKa4KNajJp
X-Proofpoint-GUID: DwsR_d9qXUzMMxd--zlm9aRJ3yAIGIk8
X-Proofpoint-ORIG-GUID: DwsR_d9qXUzMMxd--zlm9aRJ3yAIGIk8
X-Authority-Analysis: v=2.4 cv=FISOVOos c=1 sm=1 tr=0 ts=6ace60f4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=lXeS3XHMKYhu4Q0xF1pUDQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=k44reLmm0aztwNJzYC0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2NSBTYWx0ZWRfX9fWunuJmW6+f
 8bhYKRrlV0PJZhCnP9bV7WP8v+KYDQbx1rvUuzKjxrKLwKDWBskgn6/LjbIxCO9I4MgvKUd6OK6
 9wvkIl+iPXAU3CZUxjlNJQAkxq8cbepXlZQ4IVCDUwUG6K6CnB28BGludD27d0bnOEieT5NYsnC
 kOHy90XRlPReyNAFqKBxN5+ZB9HJiT9x7Tw7qC7Ox5ykbJS2pbTu3v8PNBXpTo/KyXSCXOEXVse
 4zkJ6iNfdRvrCYng9qzowtrykuSXGuSs4QMciqRCXHslyfDTwUi9UX41kTcX0jWTXOHkU6rMl/t
 8LHoGsRbJ9DFnCN0aC+wLQ99Ecelfrj/cKGQkOw8DtzMNNyRJqFF2ZB9gOMCNCfvJzE4MTdZC9/
 lQcR6am+YiqoSFgua4WQjqRPyAPcya/Mlw1vNzwAtN1WXSvZvio1MpFNio632/fSbbKxSZ0z7mh
 trUzDSOVqvcB6j+1zGA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11934
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 impostorscore=10 suspectscore=0 bulkscore=10 phishscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130065

On 9/24/26 7:42 PM, Tal Zussman wrote:
> Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
> removes the last caller of find_get_page_flags() and one of the last
> callers of find_lock_page().
> 
> Based on fuse/for-next.
> 

Hi,

Following up on this. It'd be great to get this in as it would allow us
to remove find_get_page_flags() and find_lock_page() next cycle.

Thanks,
Tal


> ---
> Tal Zussman (2):
>       fuse: convert fuse_add_dirent_to_cache() to use folios
>       fuse: convert fuse_readdir_cached() to use folios
> 
>  fs/fuse/readdir.c | 70 ++++++++++++++++++++++++++++---------------------------
>  1 file changed, 36 insertions(+), 34 deletions(-)
> ---
> base-commit: 10bd6b32965265688fa277d166ab224de8e86eb2
> change-id: 20260906-fuse-readdir-folio-009ae33a7854
> 
> Best regards,
> --  
> Tal Zussman <tz2294@columbia.edu>


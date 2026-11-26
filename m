Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659929;
	b=E23vue/Plwa5/iNSC31jQQ0wKyFbpvtTwJqaaZ6LEcK2VJgun5CO8sJU5ODgAiMzoM6w
	 IuicoZIHpVv1j2SeeDQPQAtFk/uprU2ZY34WxD9e4t+DnTWTwNuToGADbIBlE0J7A0qi6
	 nmcneV494L2HXRmtX+lMM+Fdcciut1iNg1RS6BfVF+2ae9o2D1Cz2e0538/dalfgvLVA8
	 DJN3BTRJDZwEm9+eAvZwIg2Yv/QRqV0npe2oO3cKquMsGRFfq42VIyjbNXFQXJyfqhhCv
	 +h+ynbiheDyoJFJS5eSH80VkKV9Xy10ypxkBAsK//3+1+QisBSWHBggAIwToXJ5y0pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bq5K8Z87IavuvaaKNiqMth7LGJ8zdX5mtp1Bwcp67Uc=;
	b=WnG/UkrGmoTgcVMj/LOZWXCkJ71nu14EwjxiAoyxoPk53GD8bEdOgDCc+YhVwwWR8Ulz
	 rXp9jWqOKtVv6A+dLTXLWW0fUQgoAiFJY3dVGQf1ldUt+86O1EAr+3rdwLkuWVYTyB1aQ
	 qUIdP++Y08R3N76OOKKJTEfXG4un4TV85m6/RxQBec6i1I50v2LxtvWXVTHcFC8Uwl0so
	 oIxaFohSSmhK097XAW+yHAKLwIa7a75FPBrco4jZuUkI7AZchmEvDMhNtHBkHoJdE2X1q
	 kDHMUr51KNfIJu/z2fVkI5HGNCtnXQgwGzi3U1N/D8BX7jEifxNuVz+s9AUbuVbty1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=azAUGPgc;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=IUZ2qxrR;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D39606A326
	for <fuse-devel@lists.linux.dev>; Thu, 26 Nov 2026 02:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D39606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=azAUGPgc;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=IUZ2qxrR
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ1X0e23186572
	for <fuse-devel@lists.linux.dev>; Wed, 25 Nov 2026 21:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=bq5K
	8Z87IavuvaaKNiqMth7LGJ8zdX5mtp1Bwcp67Uc=; b=azAUGPgcRU1jSI5UcEdk
	lX/Oam7hV0qSGuaoRoZ76iTO+yUv1p2TSRxSWqw/GV116U6mifykV1LTK1RDVF4I
	iKOPSY3PSz8vfny7Ha9obUkbMW6zmIsYItSxjLycctsWrDJ2rP2Qa4yaT+QQ9KqU
	+4dz298p9gibceQ5lCgFjd5gQzpe1qreD1yq7bVWWajVHsF3DL8u2w+MyeG6JCax
	6uARcxrpY97cBRd9pD/9MBjtHydvImyxeSEwdpM3USUiXBCQARMKKoJ4GgI1FvmR
	xUwASOZFEFsMGQAO+s7arILwa8QlmuqSFhjk/ZCiUMSZ1ZhwWwfuQrgDVwgAtLqi
	3w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j63n7ug70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <fuse-devel@lists.linux.dev>; Wed, 25 Nov 2026 21:25:21 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so1020728285a.3
        for <fuse-devel@lists.linux.dev>; Wed, 25 Nov 2026 18:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795659921; x=1796264721; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bq5K8Z87IavuvaaKNiqMth7LGJ8zdX5mtp1Bwcp67Uc=;
        b=IUZ2qxrR9Zhsp1S0FI7is1gdA0LL/2fFgxaaWI1BgN0ImJwm2sv6PMOhwdWqzLQDAS
         rzUt95cc5nH4fP/xoQOGsYSWeG7zEswBpj2z5mTnpdQO0H4azOSNYDTP6z1wZTBShuQg
         K5nZTxpn3Ga0jlR6uG5ItqgNeBSmEgWWOpgjARpvu2FGYqHrTj66kxBN+U4HrCk6YJc6
         FA1JOqPg+p2Ac+u6ur9+zgZGBO1gengcCrFg685AqLhjOvvJhlPcEb7k6UjAsjnAWuCn
         nAoXfaWTa4vSX91oCkxFvU7jDL/nbnMOjfWMoo3JCb7LjmhRIe+D5pk8s/bdyk4RATil
         wHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795659921; x=1796264721;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bq5K8Z87IavuvaaKNiqMth7LGJ8zdX5mtp1Bwcp67Uc=;
        b=wO3eI8qmwesW90T04opZj5JZ7tMjoiZMC75cAfOkzzGeeQzVLE/EweHhUvj1wwl2ne
         L0oEkw5Pbwkfds4K2nuXpy13xN9Fcnq2id7VZrnIwWD2KT2mT0sDnd9M+buAMCRcHYyx
         cRCP7SfpTRx0gPywfYeKHAmvWsx20ZNgv0PWLYu3BlkBsvtZKO5mPZZEuyFfEPgQA67m
         cPFfryd3MjJpykKWyqfsD+oIpyK2qGeLtd2RjVbwVYn7tmc8l7Vhc19YI7880/tDGgrW
         ZcSxm+Qd8fMCtlBcCkPlogESo5r0qv0XGQIMqQHYPWhtcBg/wHPY8F/AHxsw+ZWAIXaP
         5GVQ==
X-Forwarded-Encrypted: i=1; AL+hErE8kojmKeVCMwaOk3lbmaRnZH+0G2a56MzkDJ+2UrtyjvzlRKsX0yDvSdIfTFAP1fjo/t+PKPOif/bI@lists.linux.dev
X-Gm-Message-State: APuU4Z/vHBVy3tcQl1iwlNWkffXHhlyiWID00aWtUY6MqYF842peviXD
	R/+eRAbloRMCNRiYGaWLQEMSYcAUDsZaWGb3wXsJXq18iMYitfaX3fKqzAJnrPZwokKIunnuX9l
	kBUwz/j9mqT9FYEBltm1MMbDNcWjWdjPiKjprSFBU0BF9x3eGTzF+zkEbiyE=
X-Gm-Gg: AZFdTZeSBbPkUxOqQ5CnefTTB29GChavX+IBn9x+GtLBBzKZrZErZ8dk5it6tjtBPoQ
	zjDYOWWIDRkLhEJxup+6fNU9go1yIcZQ7Qwq6YNsIR6E0S30Y6WK/bk5IN8nPqjJM3lkshIScuG
	vONxu6AYJU+VfYUux9GfBk7x9WZ6iHV2EHk7EAOZ851BB2mS/Uk/UxQK22AuXyX+6JPN4kQa2R4
	PcNIy+/TVOyV4TH1FeKrOt05rwxoxTJ4vH6Zr4Jlj0R3qXiwfVDbHfYUEixvphSrlclIZ/a2OSM
	RmBIyW3KN4fsKawKXWcsIHG8AX87w2j1tJ4kHdtvNQTJC5xnV2VJUMu7+2dOW1pwX+5edsBSrW0
	+weqguzntQTgZ0uCDX49SIoPJGFKNgi3o6oUoCIpraEQxF87ParEc1sPEIxvb73qrAt5YL35WSX
	ItnzUy+Ygel/SqPGootdzUenH+meeuVS0=
X-Received: by 2002:a05:620a:1b8c:b0:949:7920:9d09 with SMTP id af79cd13be357-949ba99fdd3mr3499403085a.35.1795659921387;
        Wed, 25 Nov 2026 18:25:21 -0800 (PST)
X-Received: by 2002:a05:620a:1b8c:b0:949:7920:9d09 with SMTP id af79cd13be357-949ba99fdd3mr3499401185a.35.1795659920987;
        Wed, 25 Nov 2026 18:25:20 -0800 (PST)
Received: from localhost.localdomain (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ae74sm1452063385a.8.2026.11.25.18.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:25:20 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev,
        Pedro Falcato <pfalcato@suse.de>, John Hubbard <jhubbard@nvidia.com>,
        Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>,
        Zi Yan <ziy@nvidia.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Peter Xu <peterx@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>, linux-ext4@vger.kernel.org,
        linux-nfs@vger.kernel.org, "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Kairui Song <kasong@tencent.com>,
        Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Baoquan He <baoquan.he@linux.dev>, Michal Hocko <mhocko@kernel.org>,
        linux-fsdevel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] mm: GUP dirty + ->release_folio() fixes
Date: Wed, 25 Nov 2026 21:24:18 -0500
Message-Id: <20261126022418.3620783-1-tz2294@columbia.edu>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <d088452f-1118-4a06-bc16-1942e523e0fc@kernel.org>
References: <20261119-gup-dirty-what-v1-0-236d69f25c24@suse.de> <4f096d70-6f94-4148-8f47-242b8551e5f9@nvidia.com> <awWNyDZT2SVu2Zp9@pedro-suse.tail5790ac.ts.net> <55114986-0ba1-4a80-8498-bf674d64e01b@kernel.org> <away88BuU8ibcTA5@infradead.org> <d088452f-1118-4a06-bc16-1942e523e0fc@kernel.org>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LYWpeTfi c=1 sm=1 tr=0 ts=6b079891 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=VwQbUJbxAAAA:8 a=X-ZpGw2H3ZcMOUJhEmsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: eNIjV9s1LHW2XKeddk1-13rpVfvogn3z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwOCBTYWx0ZWRfX3SwZkUYsiDNQ
 auC2GpCZM/jKIloubFs6Wcf00or2NMn9CuAplHfW7awbBZyJqLs3NtUWZcIaSSDvqSk57icDlK+
 ncKziCnoavMbcs4LOaj/eWRgqhu5S7wXabiA2/cQ8P5tl+5neSms
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwOCBTYWx0ZWRfX+snAw9xMW5dd
 QnmdIis+39HPX6bfsH5adfXelNSLEp58eXT36b4Bs4blb9y/ym6MEEb2/NiaexXi3kytg7dHF7F
 7Qff9KJmbWJYx5+7vVVegUJh7RibBe8ucaQKOhfADoG6LHWdkprbGzkCj3rneQ0bwpqIf7LjcBF
 QpWSGz7mWyQtw29znovGEbHd/AQZjNNWEF8lVQAcqR0Tza13kroqJcVEHLyxO+oVVHqZFcfYZuJ
 NnYET3qsZVCxjSkvA/ZkCcpbtCL3ObDqKgIr/xoHxhJWjUvaajKd0H9TMBIV0JLsLVv2KrHqh9l
 jGllaqNo7ixtMOdV3mPmOsDoHwlziX+A9dbmWQ3mXU3Fqj1A0Gs2iWiDmDETgDmBx+BJZ+z7qvb
 BKeSbvNplCZd2qY1diVmWb3S9izCPDq93gGfv0BtEy9u43jrW5M8acaeSSUUyoNiT7F805pggAu
 0zTzJzf3+947cxGqxaQ==
X-Proofpoint-ORIG-GUID: eNIjV9s1LHW2XKeddk1-13rpVfvogn3z
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11977
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 phishscore=0 priorityscore=1501 lowpriorityscore=10
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260008

+CC Miklos

On 11/25/26 5:19 AM, David Hildenbrand (Arm) wrote:
> On 11/25/26 11:05, Christoph Hellwig wrote:
>> On Wed, Nov 25, 2026 at 10:50:42AM +0100, David Hildenbrand (Arm) wrote:
>>> 1) We fix all such cases now where unprivileged users can trigger this,
>>>    converting to FOLL_PIN.
>>
>> We need to, if not for this series then for all the other outstanding
>> issues with GUP writes.
>
> Cool, and I agree (that's why I placed it at 1).
>
> But who is "we"? Because I recall that "we" wanted to do that a while ago.
>
> (I won't be "we" ;) Pedro, can you take a look? I'm afraid the fuse thing might
> be the harder nut to crack)

Coincidentally, I sent out a patch to convert fuse_copy_fill() to use
iov_iter_extract_pages() a few days ago in order to remove its usage of
set_page_dirty_lock() and address a different race. I think it should
address the fuse side of this issue as well.

https://lore.kernel.org/all/20261120-fuse-copy-fill-pin-v1-1-72a0d888f140@columbia.edu/

Thanks,
Tal

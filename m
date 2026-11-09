Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240284;
	b=YZorWdKfIFjaq//HMn6JYShNoUXkYH1/zNG5l/vHo9A4nA3SqovEPS3Akl2GH5+/J+xf
	 zhaPNM2PAv/Lo3fIq7n/6jLx4QRBenDI1RCZg0KRzCRIc56uiTEAODJA5zSqauTjJ0dgG
	 33WjjThw8+6nM3cYAoN4HSUESFvZ/AZ5SiYv1eCT52ldeMd/BfkB+WtX6bNzEBBt4YH13
	 2pPO4mncHLOM3Xrj5aH72IQcueM9BXvNvAO7bboPhnS3QJd/OrMLFsaZ4Vhui+r/m+TO8
	 7OxRuFHflpKW9wTSZBIABHsJCb5FGjFy2g3dxUw4TmgepiHdNWa11BG4zWaUKlwPb7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MUbKECMWpbH5Hktz2WSMdey09BNdQaJCNvxGCw4T8OU=;
	b=YElopgDToX44Pasi64aVKnPIFdjE4irHKhrA+A6jkXFgnUnUPQ3daPp/U8b7kFz5AiFt
	 zDcxdTqiFn2ipZTvD2My0Vgk0624Imr/uoQi5SUgAeGQfIkYG44cFumGmLQhk4xZlRRRq
	 9QSKxsY2RPv/2P/RFJSA2kxyZNzNF9Ra2Pfct6M/BPKL/fyG8GJHB/jdm4dTSoTgakwdc
	 7btq15Zkj6StCd5vxcatGBOw42YhsCZ9ZI2YSCZvZqKKDRIrmoRq2nqEgYxw+a0bmafMc
	 DyPRG3O3119KIHTZtr3WDBnyJVu8ZIcYxmvvxZmaNhBv3qx78GdpJT34WODAgRIEWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="D1J/FkSq";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FEF606A326
	for <fuse-devel@lists.linux.dev>; Mon,  9 Nov 2026 16:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FEF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=D1J/FkSq
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4550d8ab15so152776266b.2
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 08:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794240282; x=1794845082; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUbKECMWpbH5Hktz2WSMdey09BNdQaJCNvxGCw4T8OU=;
        b=D1J/FkSqAOPlbWEGa384lHjYXcI1c9U4w46s4hQ2zCjQ0506Pn9tm9cdoy8Rh3RD9f
         VYIgqsh8kKnBb4LlWo3b+NS9j0ri0wNY8YsY9foIqf9sR1Yjz2OEhIRmEkbKMU3Itofg
         YIf0gEQ+IPEIZKX/+BPLUl7NNopt04UUcbov4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240282; x=1794845082;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MUbKECMWpbH5Hktz2WSMdey09BNdQaJCNvxGCw4T8OU=;
        b=Nql/VcO+cI2bJ1AIuQJyo+ZqBmvfE4vXw9ExVSL2CMh5nROyXck20P3+peByg8+QUF
         0sAz+9rr8dGyGMsuFfkIbZ3qnewwf4mJJpkB68iPOwgBHiOqyGcangiZOoNNzu/v7/z1
         nqmIjS9TymCtFM3W9KuEQV8qVD5+S1azjoT9LtdodzufqPJbr2/HAJay5sIQxkHaGLUN
         vSXta+3wrUriXsIoaQsLnoB7zXjuwZZKFczJaro18lJrRiM3hp/PNDH0s56OnTaMMlRf
         jHGBmmWL79bhEQcd37az0Ly9xqVaDkilsONQAkz9OKV7/VT3MEJEek4UcqR8DSLeiLpT
         8Mzg==
X-Forwarded-Encrypted: i=1; AL+hErGHAlgC/XmTQAvzfryLpsQSFIw0SCixGVLSFprVT4DU4pZMVa54fLCRmVz25sN89ioul/r8tJhDk/zL@lists.linux.dev
X-Gm-Message-State: APuU4Z9KqG+tmz3vwezmDoimROW0qO0GzV0Zk7bxZUgiYQfl7+AmXZhW
	0zlPhR+RZ4jnA6RZVvvFij9P3dMopWhHzMla0Qy/9ZVs4tSU/85f8EGlK2BolnyxLPcJCzj7IPs
	ysXlMVqM=
X-Gm-Gg: AYBFou0jwGFPY/4oluRnj4/QkZJijyD6c/bpWnlbfkTMzfVpzwO5rL2M2uHHyHRKRQt
	cTv3fPI6BJ0v4kY1xB4a8Sy5Vj7UmK0uOt4QHu3zVFkR6CZIzx4eYtEsPT9PlNQKiePKD4UOKx8
	4HL4bcBgnrOxvKU3mFDNVRQeqfP71P68a22HN2JAII4CwEAatIBDRMX+j0rR+JT/xTbtKNYoOnJ
	No8cZG7vyECJDnvFALLtiuw8+yp05ENRte897P+x6jSc6B8P5JUhHOsu+7xGnlzIsassHzzEMrv
	Jy1ccKJpfAdv2L7z3FOju5RR2QuGWqTpEvNMqbjB85Pxf5KjvzSWe7xSfUwg5vS/nK+45tMLt0+
	DksHyNoqUD3fkmaFVd2bf9jr1BI4TxWQ31qkex4SeJxHCio29xetYSe9n7gkgOFdXpS4zQyWwju
	KyEHzKydX6rHGE0gspbMS3OaJZHTdoM5eZeEOvaOPetBhQj1714kG6V6wX79Nd7J4bqSJ1p/STO
	2tja81PywuZ98dZlmE02MQGSx4mzMkoS9y8oBMpWmxs0sPzaxBgyygYiEQXgAMwdfqOvCuG7r27
	DyUT6lEai6Js7pzBLygVQLU1w16FJLc57TYAwsidTzqBm9HSSS5f0mE2OzNUvPln6/UPNrdKHzp
	1RP+b5ZW8yitDfzekT/irrLg=
X-Received: by 2002:a17:907:3d8d:b0:c2e:7da8:f54f with SMTP id a640c23a62f3a-c4d6d7ec20amr319670066b.38.1794240281733;
        Mon, 09 Nov 2026 08:04:41 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9d6867sm182192566b.84.2026.11.09.08.04.41
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:04:41 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d28f75d62so139356966b.0
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 08:04:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHISJUQoTtHOgolfqLn5h3F5qFwW2NvZBMGwHXiVzsM97fYRw7gq4DE1PH4gTOwbwVkW9XI62hQQVbo@lists.linux.dev
X-Received: by 2002:a17:907:7f93:b0:c4d:18e2:e66c with SMTP id
 a640c23a62f3a-c4d6d4d1cf2mr342046766b.18.1794239795407; Mon, 09 Nov 2026
 07:56:35 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104130118.2507513-1-kas@kernel.org> <20261104130118.2507513-2-kas@kernel.org>
 <ecad7b3c-7244-425a-9413-04d49f221057@kernel.org> <au2lsbDkyWt-To0C@thinkstation>
 <aa2a1e32-9b1d-4545-b2e0-03d213593023@kernel.org>
In-Reply-To: <aa2a1e32-9b1d-4545-b2e0-03d213593023@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 07:56:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=whnH5qLJH3Wd3bOxv--Ei6674Jo4iifGD_MqzyJg2Jm4g@mail.gmail.com>
X-Gm-Features: AclHuK_KlZ4s0u4OfgGD3UZtJodv62VcuanWvSl4PYVPZCnpCpWEdwdwFyjepNA
Message-ID: <CAHk-=whnH5qLJH3Wd3bOxv--Ei6674Jo4iifGD_MqzyJg2Jm4g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/18] mm: free PG_rcu_free folios only after an
 RCU grace period
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Harry Yoo <harry@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 06:43, David Hildenbrand (Arm) <david@kernel.org> wrote:
>
> Can we just rework that code first to have some clear folio freeing path, IOW
> doing this in a folio-specific helper?

I think you're making things worse rather than better.

The whole point was to hook into *one* place: the page freeing.

Trying to make it specific to one special freeing path only makes it
fragile and less obvious, and results in anybody who then uses some
other freeing model to miss the RCU thing.

It also means that suddenly nobody else can use the RCU path for their own uses.

Look at all the kmalloc RCU freeing: it's used all over the place. RCU
has basically taken over the kernel. Every single performance-critical
lock-free area of the kernel wants RCU freeing.

I think trying to corral it into some special case is the last thing
we want to do. It only makes things less potentially useful and more
fragile.

                  Linus

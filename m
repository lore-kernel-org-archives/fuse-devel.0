Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B5308F32
	for <fuse-devel@lists.linux.dev>; Sat, 22 Aug 2026 04:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787372344; cv=none; b=cri/qfCXkFc3Bkimfiyhf89+yJaukL8WkHIpq0GtiWU4nEmeGxIYYsdXaXj+cK7QWoZuD2s78qSzbLv1ciRXs8x+Id3rQ3hPTRlTkuc4mVIc9u8Ez4635S0HPSh2SSqfCoV7fyivEpotP3B9bVPJVVhmfOjJxYJTqqT0itCKW/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787372344; c=relaxed/simple;
	bh=/Q12GR875iD93KhzcjUTpLysJ1kI3/4TfP0uOO6zmB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imK3h4t3K7uydUSJ3F2jOLiaexWAK3npjk9u+Co/X8ZTHlVYNdcll2Y8fTxMXRz1PgEoyJunhHcktAK6lSeIVZ7H2SnJfx2Af7t2UD6M8RlJRfhc0zlbNt5SposOvNH3eUR/WlTqndKChjiGFa3mtzMUZHNiL8qZ3g9ILL2/g54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UGk2IGsh; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UGk2IGsh"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52b6543169fso11693441cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 21:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787372342; x=1787977142; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bV2EmVqYabp31e4KZo4BjvE2tm+i0eWvAIeJunRO/yE=;
        b=UGk2IGsh6aNjqYQIwuB2OdIXWwfWYB5PGNYx0aWIUagRYwPLIMH+HC+3g+QzCCN+IB
         EYKioTUxXOTFm4SM9gIYqZ6XQSTUIvZ1Xclx56C7rkDEB0EcF1fx4xVhnG9vP6wqw8qt
         uZhEfdxc03uRre2IQyfqlJV/S9s4nnh1UhOE6giHpLnqSrL3Zyi+TgrmzgG5tzRw++04
         93iNd7FITNb6q2CUR8eTl5qIfk3Tgu1SMsHbC0MGSzN1B8OrgBxdMp/lANDjNUXNVd5l
         wK+X+jBt26KH/wSmhp3LP5UBbahYuaR5co7fJ8OoTYEHxKnX2arTCOy+oITwuHdo/4h3
         bDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787372342; x=1787977142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bV2EmVqYabp31e4KZo4BjvE2tm+i0eWvAIeJunRO/yE=;
        b=Yn6RUdsDRcUhFto6D41PEzH7DyaZdojwQFH8bOtBgnIdEahe3sBTaHyND3GeYXEv7d
         tmwe5gqtKl5ljOwc4V91hGgn++Epl3Z9QnFO6CntU4riNW6P7E3dA6d2b1+u59mhrmua
         +Yi4zcUNTJ9oHL3AH9c50CxIcjLKsy39nKz5osdFat2qlc/hanx/PoRf0vVxaciCu0rO
         H2mE1CpF/m80LnHhXoSt1zAJKZtuHhmEF3dxbHCon7CUVzbWagvKirwpyglBHvUC4W+t
         S5taWzeU8MwI7oQcxjwyPzEKomOFvCEUYMUBOnH3Qx8Ls1uiCzYab+LqVkDeRCMyTuRi
         xu8A==
X-Forwarded-Encrypted: i=1; AHgh+RrOJYKK7GsVYoXara2/3OZSZotxIw1dY9wcNri0DiwE0WjSSNr81PM0u5K3QWT8N9//DRnG1YPkzYi3@lists.linux.dev
X-Gm-Message-State: AFuF++me092isjQD0f1W4GqdsHnxafajjbpaNdsNA97ndtzcB0BYfFTB
	OiGWzYGsrOFtceDsyfSRjjwZCr0srFWfPeE/pV/cP4Y6u9z/y2a/bhkmX/kWfaSiCKI=
X-Gm-Gg: AR+sD13R8RSq9euWlHq38sN/bZJGVPQfu3XKaQHqt1WAa5+xtD7VFjBqFaMWHhVAd9B
	hKdXtOH6QAs5vSeiL89z+P2EEO2C0KO+CsY+igOsS5RE9A/XGUJdOlim0PZnt8aiqufeQgaqN1e
	lsfl9jpDqE5RezVv/ToaqNDH0HRq9VhthdxLvvONreAFT9vLT5g53f+IRrFCLMx7gbp0A7NkUAJ
	UaqmZxbzAgAtLupqAzhS6s+Z08f8ER+cUYaq2b70JxQX/TonPrRtCKjF+6WzgEXJAfQaNWembd2
	yMcuQ4v0F1fkcXMVBRh/mmrI2hIUUK3PIXE6EsMHX+RWEfww8GtCgMsGT6rCFyuNTRv8VA5n2uG
	xjzBgBQ7qzDt+XE0lGrxkwhJB8xaRvLz1e8Gc7JsR0sXI1CGX1nRzXtyviAWU54NeEtrzry8VQC
	fRA832k5nH1+Fma7QG1gIZPpLHWXQEJm9YUj1c71tAJZsayTKHLlGHgQK4ugpXiCJn9EyhAXFve
	U2GoJ9tMUQjqVaFkQwYh8bXEHrrOqx/37//Bn7T0LlW
X-Received: by 2002:a05:622a:17c5:b0:52d:a247:bf5f with SMTP id d75a77b69052e-52df5a54f6dmr101297051cf.33.1787372341767;
        Fri, 21 Aug 2026 21:19:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c939314d2sm4857616d6.25.2026.08.21.21.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 21:19:01 -0700 (PDT)
Date: Sat, 22 Aug 2026 00:18:58 -0400
From: Gregory Price <gourry@gourry.net>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <john@jagalactic.com>, John Groves <John@groves.net>, 
	Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, Jake Edge <jake@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ira Weiny <iweiny@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Haren Myneni <haren@linux.ibm.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Gabriel Whigham <gabewhigham@gmail.com>, Aravind Ramesh <arramesh@micron.com>, 
	Ajay Joshi <ajayjoshi@micron.com>, "venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Subject: Re: [PATCH v13 10/12] famfs: Add runtime operation-permission (opts)
 framework
Message-ID: <aokdSo9li0RtEt35@gourry-fedora-PF4VCD3F>
References: <0100019fed5850ec-2bdfb17a-3086-44ea-8fdd-777d3ce12a33-000000@email.amazonses.com>
 <20260810202539.96378-1-john@jagalactic.com>
 <0100019fed5a5210-a09f1bdb-c705-44fc-8108-a7e7995a7af0-000000@email.amazonses.com>
 <20260822000728.GB6047@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822000728.GB6047@frogsfrogsfrogs>

On Fri, Aug 21, 2026 at 05:07:28PM -0700, Darrick J. Wong wrote:
> 
> But what prevents a malicious program that is /not/ the famfs client
> software but has CAP_SYS_ADMIN from doing that?
> 

Such a program can already unmount famfs, rebind the device to
device_dax, and mmap the whole range directly. MAP_CREATE isn't
handing it reach it didn't have.

~Gregory

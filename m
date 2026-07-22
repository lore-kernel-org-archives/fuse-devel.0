Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92995339367
	for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717233; cv=pass; b=mI9ofnwx4WrN3lihSWsDC1AfofT1VgB42YBdYhk/Q5fbLLSZY+2eLka/Iu6CgkXs3Q83aBnmCwzq7Esapw0ia3IHJZwwKncIQmoNHKICA57IEW818KLy/k444o6AeHu9PWTlgzNDrKdvbfeFdMU2eUOKVIr2lHynYmY30l/1FDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717233; c=relaxed/simple;
	bh=guAhZjJfEBfSY1xp7Mz+NJHa/zurYwT9YHjF7Gv7gyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hp0h2lRjh4+LNcDG8nNm2va/B099wHBaAQgma/i/BZSMc2buTigP08EiXfQc2ALottb7eACWEXLHYUQbg3URw66N6uWuBVxEWefe8vWLMs0qU1xVeFKRxennIxYBTUYl3+YFcH0pI9S+ZZECwtEaRXdOZ8wyBHA3G+uMloaeLQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Yq1KBB1X; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Yq1KBB1X"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92f0b5ed131so806149585a.3
        for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 03:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784717229; cv=none;
        d=google.com; s=arc-20260327;
        b=rfnYOBAYAMslM8HCmDMZOneMbLJhs/xnNs4maQiUzcOkoxBh7dQqUwatBZoeLQhj2r
         7IvTUj9L6CGa6/vBjXdbfz8QeAPGVnWqPwVDJV+/X17mArzA8WqXxga3PR2ryPs2PW70
         +7M3fhZvSV0fWgqxpcCqxH0pXgG5ccxvURynCSIuxkWZdR2l1Ek2ma9wLNwmNJHqTuaP
         zZW4J02EFur1QLHGaOAoQ+RXAljQCuttbZEQ8cs3ziGQk9k2aO3qINDy7xwXTJ9KtpRL
         aHEOITVRtyGMzpLsmmXaHfhV8VMlQYBkExsProvJIioo2JMLzesc9oVvGm4BnIFON8nz
         83ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7RG0U3kjlqqprl+YQXEPz8chW66ssUd6wO7da8Gt0so=;
        fh=nwlXAp0L9YHhPqqbpyhA9scxyOGDAOjAuR/U952JjtQ=;
        b=AEiqFsWBtOtfx3qNCWR2NrC/oGBjA/skam+JojNGw9gr9iEv6YYtfQaLUMy8l590+y
         jyeIOCwIL5VzZpXluxiFS1zoRFRjICOIm/J06xMUmsiHmmfVGEvUcb5c3Q4TqRhS+u8T
         NpzEUFy18tUh95wuRrk5zfT6998+YgxgfU9EnmOPjho0nI40Rq+mjXy6k7Fq4bEOd3Xc
         YtSflK5bcFcTQlGWi2B76i72sjRvuBN+n0uFWclq4HSu7cy6XIhQTpXKsZYGAhm78jDh
         3QZo7/aNdSnG4lnzrOMP8aErM9z7s1gY6hXr7SBQ6X0iB3rsQVOuMx1Flp0U7fCRvVHu
         ePGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784717229; x=1785322029; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RG0U3kjlqqprl+YQXEPz8chW66ssUd6wO7da8Gt0so=;
        b=Yq1KBB1XI63HMFu+0eFWKD9eu/2D2UZP2Xzx/8VUjWctI/75Q9D4m/5PLpQ6G/Qw2B
         56Cw2W09mjdmGuJPhYQbStb5oo0kT5JwCqgIE6PvoI1zO5SP3PSFWuOVzfvELFp+F7hv
         /NxVow4emrE8Yz2veij/NNPnymECagJ0fwims=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717229; x=1785322029;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7RG0U3kjlqqprl+YQXEPz8chW66ssUd6wO7da8Gt0so=;
        b=piSBUl5brrkh2seZ8XVss5zuJg6Csm6KoqKCUKRQvUOBeOVsbTxck8VfUh6YdNuQKs
         38lEUQLm/k1OfUDR7jekmrPCF8ycCWS55Oe7jtoNBSLDmS7nZuPhgtBXC9D0CkuMTxSw
         oQEWuGrObZ7RhKnwUc8pxNFnzm60OXOD/UmSkcVz/M6Hn5E1hBN4KcbjSOSVYSnvWCBM
         C+8VsdJMvZD53z34AyiDbo26JV9yTufhykBme8ZRS7k35Tkv7a/dHD4jNXk/uRjGzr0W
         2UGZ9LaE70isCgKQLztzAz2pqUuORSCe3zq0K6RKNZSYccOcOoAYa6y+u0xRNysaP30g
         vbXw==
X-Forwarded-Encrypted: i=1; AHgh+RqFiwNMG9cJH3bWmCGSUzIpT8x/NaUj9poNLEVEC0NDgZp2b41ByDT6efkfB+/WLl3odjG8IRZCKZ4U@lists.linux.dev
X-Gm-Message-State: AOJu0YyRZY8smz9bQ/ENfUdeGG8MQGaYb5sDY6CSvEMGcfTAH6JcWmJv
	8zu4kTcHXWzCKA/j73pL0mQMk2CjpVVHMCfKigzuMFvyJQiRMkBznvrP13APnw/bmlr0DFJPedJ
	RVRI7nExsUdEtpNRZjHlm/5ZWTjGyDMs2S+owhOXjaw==
X-Gm-Gg: AR+sD10QTRlZNkYJF/bIT/BwTMLVQJOEjH64x7XQp96hr01GWLlytiytiygvUnMsk8z
	OesGpUSTU8EHkJ69JsD6gV148AVB6z8Xi6LeawRnZXnW9Mmig4f2HEMN4lawpl+nCIlqhyB3qhU
	Y4oWoOotszkRItjtoG5wa/W+O4FRPNYlnxTM7nYVI+Ptgsg30EyIB8lz2JcrAQJW6wkSgi7RPgk
	tuhD+mVo2uFv5hnLSqGveaXrurTzIhPYW6VKt1bBhbJyATsB8dXc7r/SOoMRH7lVH/1MkIDBPv+
	UMO2tsec+rSOQZ7FMw==
X-Received: by 2002:a05:620a:4608:b0:92e:c118:18b9 with SMTP id
 af79cd13be357-930b43c45a4mr2167343785a.88.1784717229070; Wed, 22 Jul 2026
 03:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
In-Reply-To: <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 22 Jul 2026 12:46:57 +0200
X-Gm-Features: AUfX_mwdbQYshU7Eh86-5S9-gpZDCDD0EXLkbKHjoCISvWGty4DcFL-X4n78Y2Y
Message-ID: <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Amir Goldstein <amir73il@gmail.com>
Cc: John Groves <john@jagalactic.com>, John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jul 2026 at 12:07, Amir Goldstein <amir73il@gmail.com> wrote:

> It's not about this ioctl, it's about infrastructure reuse.
> It's about the fact that there is NOTHING special about dax_devlist;
> and no reason not to manage it via backing_files_map.
>
> The reason you stated was that you want userspace to determine the
> daxdev_index/backing_id - fine, no problem - this is why I asked that
> you pass it the desired backing_id in the ioctl.
> In fact I think that all fuse backing_ids would be better assigned by user space
> so the extension of padding => backing_id is not unique to famfs.

Right, so I suggest to just reuse FUSE_DEV_IOC_BACKING_OPEN and add
two flags: one to enable user supplied backing ID and the other to
indicate that fd refers to DAX device.  The changes to do compared to
the current patchset are quite minimal.

> And the best part is that this request requires no changes to your userspace.
> You already bite the bullet and maintain the new/old uapi but changing the
> kernel implementation does not require this burden from you, so to be honest
> I really don't understand why you did not follow Miklos' suggestion.

Code reuse is also important, but I understand John's position to want
to separate famfs from existing codebase as much as possible.  And
because this is an implementation detail I don't want to make this a
show stopper.  We can easily fix it later.

> > - Lose the famfs interleaved extent format. I have complied with this request.
> >   It makes some things worse, but we'll discuss that later.
> >
>
> I am really not aware of a request to lose the interleaved extent format.
> How can this patch [2] from Miklos which reimplements this format as a generic
> uapi be mistaken for a request to lose this format?

Let's not care.  We can easily add this later if famfs (or any other
use case) decides to want this after all.

Making the initial patchset smaller is win in any case.

> Let me recap the former review requests as I understand them:
>
> 1. Use ioctl instead of GET_DAXDEV

This is done, just need to reuse the existing ioctl instead of add a
new one with the same semantics (okay not true because of the fixed
backing ID extension...)

> 2. Use backing files infra for daxdev table

Leave this later.

> 3. Use ioctl instead of GET_FMAP

Not sure we agreed to use an ioctl for extent mapping.   What we did
agree on was to use a generic interface that doesn't have anything
famfs specific in it.

John, can you please also look at review comments provided by Sashiko?

Thanks,
Miklos

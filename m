Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6665464D
	for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724475; cv=pass; b=D3hp6yz1Z8f0zzGhcqu+6YkiYNIwNMU1/a9BiR9nckZWCTc8w8B5OIM8xlSsk6GevIRoeUAsafEC5nVQqAbXu8a4thvgifE5KQZYrkonXE/Kj3rpwd26wDOJniOF+2QOQMzI4xIoYSsX5M8J6lV3ARDgmS2lYczeKgX2+4e8c1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724475; c=relaxed/simple;
	bh=TWe1Cg0XZd9aKCfBim6632tR82TsQqkTtOSHRxZ8GhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAgWwA668muvBF26g+J3fgvEVDn3W1oeTDYsnc+qAqMKrzK8fwPleg3XtCuRT3u/ub75wByyKVJWAm52fnuSplu5iza++jAmqU9A1GN8mOTGJmxb88U0tAdViIzTcDsYacmkNMKLooecOeFR+ku6ZJqJl8zEvldgpjcGiL0c1/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duUiFi8B; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duUiFi8B"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1691e4ec40so980172866b.3
        for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 05:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784724472; cv=none;
        d=google.com; s=arc-20260327;
        b=pqNU18TFQkIay9Lviq4QGR/b59AQS6Ym79HKfIVoKTPJK4NJTE59+spe0LcMOPFxF1
         0aEoMNJ6adAJ3MZwrH1VedUFU7SxOTLedsxYd/OCbyZGjc/Wr4Aj5ZVj+yeUSCn0UPfE
         uFz36B/Mvmej5j8n/Msg67WzU4AW9wKvh2bdW97sc/CO2GU0PQ0zx6aFSNJ/Ddf0ACyb
         C+E24gUHuW7YFB8L3tjhlMThA8U9cEH92lUkNmELE/sqOW8rsoQa0fmuna119Ka0xDaE
         zfi3YBzUs11K5kTAschJqmNcRMFb+aIXZkaWUvUJyzzf2dxJ0u5K/RpBMaGMbsC+9Vwl
         +U6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XYV9hkuF2d5ODBMLR+pFWv3rbaq2dbZuJ+4IyfPmr+A=;
        fh=CsI6RYvNk5kLr1aeZRCDnqI/ZyuNUS80alCed3ITdsg=;
        b=gHxSwyPy4yXrQIrtrgFIdlIvaKjzVkCinF08gNQqhBA+n0v8FyNA0VQRcggVCylbsq
         9Vt7/74RfyX98bLPismUahXbRg96xRxNUKMZakCmDo5YA4QN6drlwx799mquFGtzpv2F
         E5yfBYMjidko0qTqqZVGuDumIBsLHHC69f4h+d+d6VWmLl56rCvN0AAW3OEqTt4FtVbv
         6Qc1HffuQHvjELLnS2ML8VG3OETtVJsmMq9HFSWwoBk46Uw1MjHflhBzlUI3mUayTvgy
         +L4fcSLwRiiTP1yEtTPdDrx4avucRxwlNFKBdMK3XGXZRHn0aIK1qY/nkeXeN8+bjZYH
         6jDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784724472; x=1785329272; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XYV9hkuF2d5ODBMLR+pFWv3rbaq2dbZuJ+4IyfPmr+A=;
        b=duUiFi8BcN5EU6LCvu+q61w198gRlcG19mViACE3TWwMp2CtILWQYAhACtcTS1r8ei
         vfNtOctprQ6ttPzHEpHKrUKMQp/DBQBR0Y3MEANGohBTnF13kTbIftcVijuh9+iKjnYK
         DphWAT/PG7IBEdVeDYLQv4+Oxd7QIP3gsyMaEpIVD3Hs/6u77F1CcWdUu0nNEHlB+Byh
         cF1AX7FA5XhRfgmCduDJpszRvN02gzP/7+wR+CZ7F8ZNNOuQfi2BLh4hz/XdDsvvoQDY
         AOOOdPCx7AZ2Pe+J5qj6Pfrmk0rkoppgLevaxOHq1uMiLWQ1JMU2RGWKbazE5ydcjL8u
         IZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724472; x=1785329272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYV9hkuF2d5ODBMLR+pFWv3rbaq2dbZuJ+4IyfPmr+A=;
        b=joxBEf0Au/XYIdb0XGDutn7JfRtrud7i4tf3bF9xQEtchtOmJmdWPHuOxaPeZpmJKQ
         wLU7QmjstOBUbF3wOZlAnG62emR1fRLKuwJgL5Kvti1XyddgEjop/0PJ3mp9AOkwnu6S
         qBBAW0Yk99KBE21/7JuylZvkbs0YmnnTDcBnJigi5/eAyqM7nqiSyU5ZXgIQqfqbuGmP
         7/T+qfcpR2c7EerIsWDGlRX1dfbPk8N+kvijZIJK6J7TtmLei11nOYR4Has81L0Pg93f
         dshcPgfv2/geyT7a3ZUTx+B5mGV+7Q+2iklUw73oaWHCV6qVaPs56WLUdHyDUJ4rqr8F
         ZM0w==
X-Forwarded-Encrypted: i=1; AHgh+RrtMJIQrEaqt3a2+5opyw0cnSdAmIOP2Qfzx6W8+NvxYj7nBbR963vGUnjgY40ZlMnpsn9pXJn7/ZLP@lists.linux.dev
X-Gm-Message-State: AOJu0YxbTEv9S5+dCR4Ea5BpG6Ue1e2miKqpLB9qpbFZmmQ4MqXqRvWz
	RNlJmIw0arHiJoTCYmhczAYUOqhsj+7D2aG715sY8Ux40HaaDIHCeax7bp5UDBxObSVYZJjgupo
	TdToofsaFgh1Bn5q+//KlBHcjkjAHbpk=
X-Gm-Gg: AR+sD13UfwQXacxY5eefQMuIVMMhytu1/RYsuaKQZUovGWfhpCLJv9gBSDu+ovKHizh
	vOH0FzcfFUcgZ71gyk+DdC6hEzKsFqCkfqs98zk3egDiLeQX+ogT3FBu9+Z6OeL4cDGLC7qpP6p
	prR4s1FtiKAVdhx22yiIy11OzQnboagqUClTjJ1oMNXI8i0Ogj5SkCBxdxghzwDFWGBIMep0jBk
	ClNoPFhLU3xFH7fW6NhaIYZR7aFaiF9h2WmEEpII0IAKjJFngBs5o4Ly2OjpGA=
X-Received: by 2002:a17:907:972a:b0:c16:46b1:e0c2 with SMTP id
 a640c23a62f3a-c16b48a8b9dmr984425966b.62.1784724471369; Wed, 22 Jul 2026
 05:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com> <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
In-Reply-To: <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 22 Jul 2026 14:47:37 +0200
X-Gm-Features: AUfX_my2cSFlhFYxiKgO1hiNmZM0_RgRfBeCPM6_N17W9wq10tY2PdKKMNctT2o
Message-ID: <CAOQ4uxhuivjMMt_Dm3VwKmOhHg7ZHdAww6j6jp+RMjPoRde+bA@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Miklos Szeredi <miklos@szeredi.hu>
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
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 12:47=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Mon, 20 Jul 2026 at 12:07, Amir Goldstein <amir73il@gmail.com> wrote:
>
> > It's not about this ioctl, it's about infrastructure reuse.
> > It's about the fact that there is NOTHING special about dax_devlist;
> > and no reason not to manage it via backing_files_map.
> >
> > The reason you stated was that you want userspace to determine the
> > daxdev_index/backing_id - fine, no problem - this is why I asked that
> > you pass it the desired backing_id in the ioctl.
> > In fact I think that all fuse backing_ids would be better assigned by u=
ser space
> > so the extension of padding =3D> backing_id is not unique to famfs.
>
> Right, so I suggest to just reuse FUSE_DEV_IOC_BACKING_OPEN and add
> two flags: one to enable user supplied backing ID and the other to
> indicate that fd refers to DAX device.  The changes to do compared to
> the current patchset are quite minimal.
>
> > And the best part is that this request requires no changes to your user=
space.
> > You already bite the bullet and maintain the new/old uapi but changing =
the
> > kernel implementation does not require this burden from you, so to be h=
onest
> > I really don't understand why you did not follow Miklos' suggestion.
>
> Code reuse is also important, but I understand John's position to want
> to separate famfs from existing codebase as much as possible.  And
> because this is an implementation detail I don't want to make this a
> show stopper.  We can easily fix it later.
>
> > > - Lose the famfs interleaved extent format. I have complied with this=
 request.
> > >   It makes some things worse, but we'll discuss that later.
> > >
> >
> > I am really not aware of a request to lose the interleaved extent forma=
t.
> > How can this patch [2] from Miklos which reimplements this format as a =
generic
> > uapi be mistaken for a request to lose this format?
>
> Let's not care.  We can easily add this later if famfs (or any other
> use case) decides to want this after all.
>
> Making the initial patchset smaller is win in any case.
>
> > Let me recap the former review requests as I understand them:
> >
> > 1. Use ioctl instead of GET_DAXDEV
>
> This is done, just need to reuse the existing ioctl instead of add a
> new one with the same semantics (okay not true because of the fixed
> backing ID extension...)
>
> > 2. Use backing files infra for daxdev table
>
> Leave this later.
>
> > 3. Use ioctl instead of GET_FMAP
>
> Not sure we agreed to use an ioctl for extent mapping.   What we did
> agree on was to use a generic interface that doesn't have anything
> famfs specific in it.

My bad. I thought that FUSE_DEV_IOC_STRIPE_OPEN was an
example of how GET_FMAP should be made into a generic interface.

Sorry for the misunderstanding John.

Thanks,
Amir.

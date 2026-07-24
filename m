Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E033ADB97
	for <fuse-devel@lists.linux.dev>; Fri, 24 Jul 2026 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784924611; cv=pass; b=dEDstm9Dzxmkh+eTX4Z0A0tt+znsi2Tabuhwk52c+y3WND0QJnkHqNhpZGvCbbTx8v2GAhe5EcF0dR99puzwaJdUvMka0uaV1BPUVFIbgZLnw/VFjbSrIPHIYTowYmhNJd5I4DQ2ZiCKt/OOktvp2wTG90qfOHNRWgOj6hVamGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784924611; c=relaxed/simple;
	bh=CLvryJlgtOkpD04dLgTszNnfnuSEyddIT/JzxgCf0Xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f44zIi+5m7VbJqJLsmo17rs0LuozHFyW/EFJI24OKgGywX8VS/IjDFRY+iZGY74BykrI/CieFeOJ3PPEpjEvpM8DXyJizADD0KnrtCmlzXRHjoW6gy3tT/xK1boXXa9vhMnZY3iPUhiKPSx8yrkJTik4P6XFnvBucZQx/owrfTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCB3We0Y; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCB3We0Y"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4758bd3731bso670135f8f.0
        for <fuse-devel@lists.linux.dev>; Fri, 24 Jul 2026 13:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784924608; cv=none;
        d=google.com; s=arc-20260327;
        b=CBj49W7gSGeBmEpk0WqoXeKZysYwDIFcfLllAmffXv0zAOVTm7M+UGsiPx43aDtran
         hL3bUCmJguwYZ1sjVfNHoteUOQUlzrE8PS7F6A0zHHS+jMhtqXoECY6rXkJsleRwDsFY
         OA1pJ7Mql3Cz9x6gdxWe8K8XH72f1N/U8/HhWlnyn3kSYhAEHrpiJ5UbIS0qwzMd9y9m
         +uKUJZSEKyhgtszuShGe702LUQ0MoUOGWwDmNeW6zC+1z80mg4YGm9nBjDatZmNVlVcJ
         JTRSd7DSzEOQGp2Uqap5sJDCF0UDPSqQdqOAgQZz/OBSNmBUAK4VrrpjVpqxNsxPlcLM
         T1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Khp2FCMG1fPFWK/vo3BDeHUm3k3OSQAePpUYhFSlseQ=;
        fh=plHrNsDdxsMxxYuh36CWo++wGA/pbEX8KlHepoBXHHM=;
        b=SKrA3f5TH9Og7J4/90pG41W8UCtejDrcCdF71G8QpF2u1iwL7FUcWAZLAe3E1DBBUw
         LH4tfNi+PhqpX1QFZhlrTS4Jnll44fTQD1Wq6JidCFFg62TPFZqdukZ/s++59jusZe1o
         aeu3NXVxbmS2ypg6MIp71H2P7XTKuAIBgXUyweRQW6xCUzoDz2t6YFVhZMCNwp18Ybaq
         GwrpTweGme6XYuQrYdEGqwzwxFInjUJjl++YGyHrrXMLYZ/Rq+SOtKnw736atIqjrmkD
         lauuX2weDsIJiHdPRwT/8DGWKYKphsxFWfG7J4PsGnV5iV3aHznZClnqFMteyf+4eM+r
         bqrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784924608; x=1785529408; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Khp2FCMG1fPFWK/vo3BDeHUm3k3OSQAePpUYhFSlseQ=;
        b=OCB3We0YP2BymY5nV3t+OYiWGNjAIOhJA8H5DaXbjWzI7jeo6lhwvKQSMHImqS9ltb
         ewmKyQ5YDd1bO6XwT3W+px/UyVqUnAwzRbZbAp48SoZ4OJctajODJyACk8HSfpnNaJ10
         ief2ewsrcgbLIYog4uHm50aAyI4ZG+ea/kSSYWlzQ7UL0tOet3k09kZxaO/q5f9xJpjz
         nWSBEeyOTH0uJoCOhgofRvB6ZhIQOg8LuBV2PwK6l3tOZtNMS7Kuf4U4Ip/80aeUxn7H
         pFx9kxsM44VijLvnisb7UTdsF++Hx3b+MfqEwyU4s2LnhHljiQ+Rg7xrkygzDrkgkz1u
         gasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784924608; x=1785529408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Khp2FCMG1fPFWK/vo3BDeHUm3k3OSQAePpUYhFSlseQ=;
        b=KsuvDC4txjLItff4+TIQLQTtDtplbosM/fvvW4p7Fweyj4nvbuZvwO0ejkga8Spin3
         hAaRVednN6ec4gSGSgY4LPHwF4U52hmCgk8uLhryb5Yuslk7W5FKA31Sd9y4pd+09l6R
         5fj8Z/EbT5/GL+3qhXAybJUnucViK1NHI5eMFEWyZA3hq4pym1gHDJ4/F/j9QFFuDGYC
         gM4AWdZkZHGT18RpRf++PJ60Mg8pfDNx/efIi1B2gaH3IpYXggA0F2l5hN2vyiOo6bgZ
         T9eZ9kTpdEApiK8osWQq46lMoXJvVZf+KFjVumvJLzRYZIe6Y69PlD+JSpd+Do/+JaV/
         4iXw==
X-Forwarded-Encrypted: i=1; AHgh+Rqo9kPfHPwPRClNhfV3wEXcx50MFLcJn9lAoswir+2hhoO+hXu7fEdBmfsjkFkhaB1ZB108e7wMBnVJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd7D655pMqWv9SXMfKTuDQXfGDCl1uM+UQ6R8Ze/BJJI/JbTZp
	FQ+3o9t3UcqzUZ16mBmHdRwHe56E37FYV0Y0kSYKNhXJcVq0OWxYcytedkdxdqP/ekoy47iUHXr
	g7WiWzogEjgGFmrGV/U7ti2/Y6jA1gdo=
X-Gm-Gg: AR+sD10HoBfr7YQlpUqwKVbLhPG6vnW2Hb8kA23hwVqBCxqJD8RAd7ix4VU7tqd9j+K
	kRVJBiQgBVfYQT4MKLUzYTTHV5+joESbZr5py14vctmOlLxP8lsV73uOmuPNlWpsVHuOvVJlmYZ
	EOqpET6dMtrgI1FjIuUdXAqcAh95N1/IAZROFoUBPYIzDmKQdyCUjX4QqM8rbB0nixjW6RRJ4MS
	F1hdC3JSJTK9NnGaJlCUgZeQtnWNuDYtnMg1miTuXk1cFEWcOtWPyd6NR6qQywiPew/oY332sCk
	dGTPiSD16dw7TcGC/zpvZeD5uB1r1X+TBsMTUzUDgV8wOAjm0yzQ
X-Received: by 2002:a5d:5c84:0:b0:47f:8554:a341 with SMTP id
 ffacd0b85a97d-47f9cddd94amr2609691f8f.13.1784924607527; Fri, 24 Jul 2026
 13:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
 <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
 <CAOQ4uxhuivjMMt_Dm3VwKmOhHg7ZHdAww6j6jp+RMjPoRde+bA@mail.gmail.com>
 <CAJnrk1Yat+SEr=SmZXwUt9y2WcC0VEC4KUpPrkrRSjMEmx42WQ@mail.gmail.com> <CAJfpegtnja6tkOnNPD2WZxu14Dd+UM9AvynsVB_E268iSXLbkQ@mail.gmail.com>
In-Reply-To: <CAJfpegtnja6tkOnNPD2WZxu14Dd+UM9AvynsVB_E268iSXLbkQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 24 Jul 2026 13:23:15 -0700
X-Gm-Features: AUfX_mydRGom_LxmLbEq9SuIROw4SCUO4oftMjn0zu5GW5N5sw4eN8rSuSzGEXw
Message-ID: <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>, John Groves <john@jagalactic.com>, 
	John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
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

(sorry for the delayed reply, was OOO yesterday)

On Thu, Jul 23, 2026 at 12:27=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Wed, 22 Jul 2026 at 16:43, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > I had the same impression as Amir. The FUSE_DEV_IOC_STRIPE_OPEN patch
> > [1] right now is only for the interleaved case to handle striping, but
> > imo it seems a lot cleaner to make FUSE_DEV_IOC_STRIPE_OPEN a generic
> > interface for handling any backing layout that corresponds to a
> > backing id, and having the simple extent case go through this same
> > infrastructure / path. Especially since John's future patches for
> > adding the interleaving will go through the ioctl, it seems nicer
> > server-side as well for famfs to have one consolidated path instead of
> > needing two totally different ones.
>
> That's a valid point, but I still feel that those things are different.
>
> Striping:
>   - always static
>   - size limited by the number of devices
>
> Extent map:
>   - may be static (famfs) or dynamic (general block fs)
>   - size is unlimited
>
> Doing extent maps with an ioctl makes it clunky in the dynamic/unlimited =
case.
>
> > If not the ioctl, what did you have in mind for a generic interface? I
> > think anything else would have to keep GET_FMAP, but maybe I'm wrong
> > here.
>
> Good question.  A NOTIFY_EXTENT_MAP (similar to Darrick's
> FUSE_NOTIFY_IOMAP_UPSERT, but multiple extents) would work, I think.

This sounds great to me.

As I understand it, the merge window for 7.3 closes at the end of
August. Just to summarize, the only things needed to get this into 7.3
(besides addressing the Sashiko comments) are:
a) replace FUSE_GET_FMAP with FUSE_NOTIFY_EXTENT_MAP (will also be
good for famfs in general, saves an extra context switch)
b) remove FUSE_DEV_IOC_DAXDEV_OPEN and reuse existing
FUSE_DEV_IOC_BACKING_OPEN (logic for this already supplied in Miklos's
patch in [1])
c) remove "config FUSE_FAMFS_DAX"
d) remove FUSE_DAX_FMAP capability (not 100% sure about this, but
since the only thing added to the uapi is a new notif type, seems fine
to exclude this cap flag)

Is this correct? I think with those changes, all the
famfs/fmap-specific definitions will be cleared from the uapi.

imo these changes seem doable for making the 7.3 merge window. I'm not
sure how much bandwidth John has though. Maybe one idea that could
work if John is completely slammed for time right now is having the
changes requested above be a separate followup series someone else can
do and then this current series (after the sashiko fixes) and that
series can get landed together in the same merge window.

>
> Maybe the striping setup can also be done with a notification.  The

I had interpreted the FUSE_DEV_IOC_STRIPE_OPEN patch as implying that
the mapping gets forwarded to the kernel through the backing id in the
open() reply, which I think is how Amir had also interpreted it. I
didn't like that the striping mappings got sent through an ioctl while
the simple mappings didn't, but I think maybe the patch was not trying
to suggest that and I had interpreted it too literally. I like the
striping setup through an ioctl - I think it makes sense given that it
is connection-level instead of inode-level.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20260529134302.1989958-1-mszeredi=
@redhat.com/

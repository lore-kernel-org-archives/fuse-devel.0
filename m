Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0EF364942
	for <fuse-devel@lists.linux.dev>; Fri, 28 Aug 2026 03:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888042; cv=pass; b=svN44tCybBBuJwDbiM01j+xuECCt++MUVrYHsXxLKgzXxX0rfCkU8J0tb/Cq4Avpis+l1C3kMn1i2oHpBSuDSWdHYhwrnT4p0jKjjivTnukqlK6Bq1EKkUl4NuGKICyu1dwHAw8yqfTyVH7sx7loejSk6Q1kDObFbPMJbVnG/Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888042; c=relaxed/simple;
	bh=eVCUgnuZPY9rp4G0hxfWBoh/8wdCFKKRU8Eq9Q7yXbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzUXfOQ5/HCFeLAQeRjo7+frQaJdD+mu627MW0/+XnHzbFSiMrEDO6rxkE5ImKJMF7LYFmUjMIjbJVL9vtcHxMDzSoeVA/KlnH0i90ydTyfgEyIa1mHOH9YLGTV9Gq27mOR3MMRwrXdvpUpV35HPul3NCqCWpvsO5TkYnXjSMU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdJJ2yNn; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdJJ2yNn"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f4f824de5dso151191a34.2
        for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 20:33:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787888039; cv=none;
        d=google.com; s=arc-20260327;
        b=qoqTC52p7KYqkvRaUiHiffNSem1eHr8x2+M4oxIvTOBWRO0ij/wH/Au0/nXasl7fuP
         VQ9SmpyIF3Bq28o5QYkfd/E/V5u7lW6Y+yFc2OfZPgfnrCYfHjFkKRmuHQVsvc6QiChK
         KZbXAj24dWPfWx8DEAILH5ptEwP2Q3OI6t4LIpHC/T/9reJNuzPQ7d6S8nsVu6rOL+5r
         WKeFCBmdHk3m/CYKafm7yyv/fjwM46FIIa8W7J4AEV7j8KQMv8d6HpJ1Bh27fBAMRgkq
         j3D1ZYzP+DtcAzqAII+KCGAyMaO43HkgeSubVTThryHypEz7xQgZfcWsO26VB3ddvTC6
         GtnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJ6GRA/2LwQW6/jDEIjrj/TZS2ZKHOJ3XYsZbyYACDw=;
        fh=lctSzsolIOYMnsZkptUKB5f+4G1cl3ElcDqz7lOZgKM=;
        b=SC3KyFcAPqFChIdmGoVQLvwjd4E9aha2+XmzKk/EqJ+NUatbDFz18eJ8tsjVKB2mKL
         WZ6w8FJcte1fl9qyNtdN4lQGbOH3Z8GXNA/gBdZHgCrCc8lfuQT9Q0r+1SW0ldHd3koo
         z9hwEtLbHovW2TSe951oFLHxD0NymGUc4cDJdgnsh/HK0YlcTHVzWxA5obGkt+mLyvFH
         BttUR4THw4VY/OBIffAavB3ddqOX0C7LpPaVFqXp0MThXkv2KvLWlO+LizC6X6xOImQ9
         jLOy7lh7uEfk890JR50VBS0jbbUFF3w7tTVJ/h5hKPH78lyx4I+/6IXUbE6RCYrxr0W+
         Xx+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787888039; x=1788492839; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJ6GRA/2LwQW6/jDEIjrj/TZS2ZKHOJ3XYsZbyYACDw=;
        b=cdJJ2yNnOnxOrhaH7Md9N8i4ECRo/c8M7nIAvzZ5P9hNwjBOYEJFrlvwlxZnqZc/yR
         GKr1NUuxEduikCcLeQQj4G8PBwWLSH2H3xfSFcTZhT/K8ijItvLiTWZDir3f0jLbFaxw
         TxHn8aRO8p2Ea21i5UVSRubYx3EvNjWaTc/l0l+IzpU4uraxrJjs3Bj9LEPuNJ48W2Mx
         n0DyQ5N2ci99sVlv27qNgiHAlhRjAB4aSf3ZxWfqK9L0tc3/Snn0T4sF6tKgeYiqsi6d
         puAA8HWcEYzwHw5QMKYFwRgzCWfmklcBBJfO2tXcqaC7m9DjVzN5+CD1krZ5RRqQecrp
         K6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888039; x=1788492839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJ6GRA/2LwQW6/jDEIjrj/TZS2ZKHOJ3XYsZbyYACDw=;
        b=eJfgevcs9c9u21VXfqcwwd37Cw1zEeBs5LGQqUe9Oq1pMNXItcYDEzuLVYxBx1tIco
         LWD/MG/LAebLkJuc8Z1f8TAbaU8+7S0N08SVM+hZ51sAZJivOmofmT0TO2oNxP+LBGVY
         Q7fy4UUUBnF1et0/nhtXlxGyWBIc5S+tsWZMYkpZ1BUsB43VEiDDGpN5fGZmI6MlWYI3
         e2nyDb5VQRq0UTazgmpJj3gI1hjsv6/vAtOhQYePNUujOMpR27hWAdZ2NUqR8MhBfAUN
         cDWhg80GrPKVh2MW68G/yQeReOh+i0Gp7YZOuzXz8rDdKBeZXJSL7jW+u7Y7+z8Q3iUK
         5WIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRG46oVGwMhZQGAMocv8FIHfB8F7GjX+mBQ1YEjYsw8nLzJbl5mbHOxkQjJX4k6IY6G1AXwKVU+QsK@lists.linux.dev
X-Gm-Message-State: AFuF++mcgav1DLOtrdQ9WSymvgs5TS4gTT4q1CqzrnwvyrBHalZWQq19
	o949KMRIz3WLCq+9Nwo8XWL2PyBEwEzqq+g1ifqHiqaIMfqh/XrInLnuWJbuEJWwEZgqyRKk+Kl
	21QIBzjLrxmG9T+76hfTuTQBSud9Ibo0=
X-Gm-Gg: AR+sD10CJDqmcYL+CezhtuRg1ULH8wZCJxfClL+9nNaL9sszg96Mr+zqkkBL7W5Mc9g
	5wCBVxQiLgiBf9aIYK9h8w/5J5JXB9gLm0j5/Ff0yKqm1GFGL3gyMk4FMHJb9Y25wEtIq7zSpyw
	YE7OmFBYMzWixoxP8ROFa598pvZjwNXboHvzn5soM4wS3lFSqjui8IHi4i02ueHSo+NNVyJ6OYm
	M3yixCqdMmg8GhPoXiq82pOnEtHbg6obYxDoj8ij77rZU2Ml5WSWE+SXgFK9MmRO54hnG2GkTtF
	DDfBcE7pT5Czj5Fq1VlkSUfOj3lMQoB0c4EUixdSmh6ZSfYI9iJARFvVGgteFZaC+3NvjEItFT9
	ukNz1nO1R0qX0DVtYEc5EGrW8ykHw/p6iLVFZ7XZWyFH8
X-Received: by 2002:a05:6820:340e:10b0:6b1:67e1:fc8e with SMTP id
 006d021491bc7-6b1c66e6ce5mr2559540eaf.25.1787888038951; Thu, 27 Aug 2026
 20:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827185722.3234622-1-csander@purestorage.com>
 <20260827185722.3234622-2-csander@purestorage.com> <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
 <CADUfDZoEosgMMQ47BDWBskTOZrYZpg6VUT5c4kwczDLRLXYk=Q@mail.gmail.com>
In-Reply-To: <CADUfDZoEosgMMQ47BDWBskTOZrYZpg6VUT5c4kwczDLRLXYk=Q@mail.gmail.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Thu, 27 Aug 2026 22:33:46 -0500
X-Gm-Features: AcwNN1V96G10EnqkMmlBEbQoJ8ihVOlJhML3SIuW3TsrH3jrmu0CBU7aGovmtII
Message-ID: <CACVXFVOLBVVGwfo+mbn+4jnGKZS66dL_2ghsKiaT6buscWJg6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, fuse-devel@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:44=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Thu, Aug 27, 2026 at 1:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > Hi Caleb,
> >
> > On Thu, Aug 27, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
> > <csander@purestorage.com> wrote:
> > >
> > > In preparation for setting the io_uring NVMe passthru CQE results fro=
m
> > > the blk-mq request completion rather than the task work callback, spl=
it
> > > out functions io_uring_cmd_set_res{,32}() from io_uring_cmd_done{,32}=
().
> > > This allows io_uring_cmd_done{,32}() and __io_uring_cmd_done() to be
> > > consolidated into a single CQE-size-agnostic function with 3 fewer
> > > arguments than __io_uring_cmd_done().
> > >
> >
> > The conversion looks logically correct to me but the interface feels a
> > bit annoying / fragile on the caller side.
> >
> > Is there a way nvme can get what it needs without changing the other
> > callers? Would it work to just keep the existing
> > io_uring_cmd_done{,32}() as is and add a separate API for special
> > callers like nvme, eg:
> >
> >   void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 re=
s2);
> >   void __io_uring_cmd_done(struct io_uring_cmd *cmd, unsigned issue_fla=
gs);
> >
> > where io_uring_cmd_done{,32} would then just be inline wrappers over
> > those? afaict, then only the nvme callsite would have to change and
> > fuse, btrfs, block, ublk, and scsi_bsg could just stay as is. Do you
> > think something like that makes sense to do?

Yeah, this way is definitely much better from a driver viewpoint.



Thanks,
Ming Lei

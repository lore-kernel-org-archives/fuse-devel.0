Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3FE36C588
	for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 21:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867072; cv=pass; b=BbDGoNis5LLxabTwP0//NJVGxroHSkj7VTgSnIXlDK6Jr/NRRUJU3FSTVV1oqiGKpEDjuF3KP540JWSvuJuAH9pSaSJXfEFtCu3p1XHyIU3IV8rnMvB48h1YEqtLfZt3p21ICcZNkw75cBxAKCffAIsqo+4qFF9w31kk/pdlm3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867072; c=relaxed/simple;
	bh=0sBuqucNWMJ3PQ7mkm0GStLfwt7hAbIgMaO5tBFyaUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E23NQOYbajELZfTsc0EzNWutOHGqDiRfOPoO8W/6XuJw0lRL8/Jm/k1ID2eQA+ksKgixrWCYBj8TSlO72yN9wvhgBKGlWLfaKddtaxS5M1+v5dLEKdI+giIsv+klgGaHkqS1eKu25/NUH/wLo6n5yGCLxBc8LzMcp6HG9WsGcT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Va77KthW; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Va77KthW"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-45ef92f7cdeso121489fac.0
        for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 14:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787867069; cv=none;
        d=google.com; s=arc-20260327;
        b=Qu1MJD/QPFlSjHQbLK3RNpRivodGaq+Ykpd+xHbL8+SCTXyX4J2Mj/nHTh/3Qhve44
         Q4iNfO6dg8NTIrBaRFyk9jG5EJNyMai3nROob/9/UczeW42naEjYXpd51DhTWFvUhvIU
         QYNTWWYR+Ik4nk+Fz/LKVgCmxC2nTZ2a8Tgglo0KxCjzioVG22zzCAdKIRSWnbog5AwF
         wTcmtJVSFr0uwZa/P/opcQ5ms/ngkOtLYS+EqCyBn9AeSf6JCsX13BhJDMQuQCc6XvC/
         /2mzQ2m5ACDdcT0eCTkNOLbWjwMSG/qeWcNafG7GNp5ONwRQBICM668d2WFXiFnWUxP3
         7h4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kqBamkmhnxpQu01OYVCgjjVqjgGXsL5/W693jooZv34=;
        fh=Fj47wHZpcvO0Ded53/yhwRNsMo36PgPD5+/qNn3GC/g=;
        b=TypG2YyKg7MKnmRZOn+ZoV4qseoxGd/95XKi8AilAM9wHnczewECQiN6fb+D90rjTH
         hMFuogs0NjycEfu/AZ4wvY2s6iif6xD/uomKTo03HCd9hEFps6p0hpUxfETKzl3ijUX4
         tkjwU8p/dQWotT9F3rhJLqH2J9j1aRqVxGinrALWyYOMu3O1BQTOVBotIsXZYP94HKMj
         PY7qgkd2wNOA8nGFwxiJGK0oC2KEN48UKR06bHP3djMy0oDZtsMM7HbySazi6dA+gzFI
         0oVP97JDDkdqeoOgDBtTTRcXTHjQ9b6ZatLnR6LqIXwEoiBWPEY0EOuk/+JU+Lo+z6Nw
         jLzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1787867069; x=1788471869; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kqBamkmhnxpQu01OYVCgjjVqjgGXsL5/W693jooZv34=;
        b=Va77KthWGR7HqCOLTOka3yzNoCxLNmlxVc66DoFjRz4F975lpSJ85LXv5TL1c7zQ1q
         zDBcXdwuVKVx/5HFZvx/iKbUmyaiUgu2O5q4tyxJmzjWoJ6ZkFrhkKmDAyf8uWtDmzfo
         s5wcnpg0AWmf7Hrr3ZRkzaPS0mWzPvdv42Sq1FWNDcI6opPCmof3lodxcHg86NYSP3TQ
         xgShzAQfswuGwYqYBU0vGw8ir8VStgTypZTkAjNrj5yCOY28GQKup2ydxc8H9yadHYDL
         Gh6bnAk+uEykXWAUjygokXJIL36dDb9DnVLz3aMfx6anpNWEArS0RIBBz55pCQWm7nX9
         mDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787867069; x=1788471869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqBamkmhnxpQu01OYVCgjjVqjgGXsL5/W693jooZv34=;
        b=TrLnIkWWiFgEoudUZ36MKUtujBFqutPBEit7gYOYcvfeAaDcG4ZJ7H33wiR/aAEOgg
         R7NRtq28H/rpZ+6qBcEoKHbYvnaVbuJPmKBXuQc2IhXVF0nLktqbx6na0dc43B/8fNeK
         ApqXFJxaTmjWP5rfigz6NwxVrjs8XA5li4lG0cvxOdeFrQ673lZvLPwZpz2PEoKp3EgC
         Y839Yt50WL/I6Tu6wj6s+HPO9s0BxmLkCUuyJe90TDWMlIC9X6153bRDNNofclkT0Ka3
         snH3/h21b8595VAxwSeCey6f2y7fGMzFqug1FmUbzFVBtPqBA4A1hTxQtEh6kFjE5m2v
         1S/w==
X-Forwarded-Encrypted: i=1; AHgh+RoOM4xTCrPTIc0EkHJOdF5Gwz51lBqm8r/hpWs1dKUpBK7gdAGGht89hRwvFJNjDQBsI6RP4hpYm8EC@lists.linux.dev
X-Gm-Message-State: AFuF++mXwvfWnPiY49ON4AwUF57mpmFflQJKu4d/f8a7LtPvjdzxJUHP
	ipXcDKe4iRdIVvXzVAl37OD33kht4u0nrqfbeyIvsUcAGyHgnxYOafwC8wKQhhtEiFfmIENcVJ0
	J6jqmbHcjerq8v6MNhnCqMa8bP2PySJkIK6wIH0MtWg==
X-Gm-Gg: AR+sD12R0PgCn7MNMclLyie78VHgRNdMRq4NMs2GM2K6yv5VGYBk7ObsQHaN9jMrz8q
	jIFt8MZYT1gIy+ABoVWJyt2cklCamUxCKtl9vemx0pfGkcTg749HOhSUGrKWy/mAGh5/cvmSX2R
	IchfMoTjH1Er/P5iNe8i1exzt9nSBL9gdUvw3jwCJxEjKI47w6gliIBAumJBhUqBWnSJJvv5EZY
	4LQg4QGscwR0wgMliyQuwcD/Y2BOPDJFmhkOFCE6iW5reJFLGQ5ndKHpjdg1/HwIEXj4clPfczi
	P6TByYVxp5IPcNIXteDnDPwVkRsYbrdQtkzsgscoWY578w==
X-Received: by 2002:a05:6870:45a0:b0:42e:7e04:e9ce with SMTP id
 586e51a60fabf-468328882d8mr1702119fac.0.1787867069273; Thu, 27 Aug 2026
 14:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827185722.3234622-1-csander@purestorage.com>
 <20260827185722.3234622-2-csander@purestorage.com> <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
In-Reply-To: <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 27 Aug 2026 14:44:18 -0700
X-Gm-Features: AcwNN1UylVUquZ8opNqZqu3tNIHriO6d1S55vB3s5Iygu5DbEGaADAEUlDBXhJo
Message-ID: <CADUfDZoEosgMMQ47BDWBskTOZrYZpg6VUT5c4kwczDLRLXYk=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Ming Lei <tom.leiming@gmail.com>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, fuse-devel@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 1:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Hi Caleb,
>
> On Thu, Aug 27, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
> <csander@purestorage.com> wrote:
> >
> > In preparation for setting the io_uring NVMe passthru CQE results from
> > the blk-mq request completion rather than the task work callback, split
> > out functions io_uring_cmd_set_res{,32}() from io_uring_cmd_done{,32}()=
.
> > This allows io_uring_cmd_done{,32}() and __io_uring_cmd_done() to be
> > consolidated into a single CQE-size-agnostic function with 3 fewer
> > arguments than __io_uring_cmd_done().
> >
>
> The conversion looks logically correct to me but the interface feels a
> bit annoying / fragile on the caller side.
>
> Is there a way nvme can get what it needs without changing the other
> callers? Would it work to just keep the existing
> io_uring_cmd_done{,32}() as is and add a separate API for special
> callers like nvme, eg:
>
>   void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2=
);
>   void __io_uring_cmd_done(struct io_uring_cmd *cmd, unsigned issue_flags=
);
>
> where io_uring_cmd_done{,32} would then just be inline wrappers over
> those? afaict, then only the nvme callsite would have to change and
> fuse, btrfs, block, ublk, and scsi_bsg could just stay as is. Do you
> think something like that makes sense to do?

Sure, sounds fine to me. Thanks for taking a look.

Best,
Caleb

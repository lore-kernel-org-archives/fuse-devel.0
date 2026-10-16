Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D033BC69E
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142775; cv=pass; b=m2WYKTQSE2ATOUUre6M29yuU1cXNF9eZIvFvS5QUdUhRYnF1Bhq1t8BHNiMcEpLHtF6N9BJmhcZmIYetgSkAHwmGMrEtX14CdfzMgfHnqz9Mx1JLmtXPzTEiUI9KIqTrOig47ePSLciBVqoAnKMHyZSYq3zWDMJOsnGRXCxLoS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142775; c=relaxed/simple;
	bh=HGoCw8arpCvJPsqHUcXcqUYXTcaAYS9oUg/iWN4NGJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUd3NySetYgJsb5Eu8ENTusQdYUS7FA4z1/vZpwnTorV/75lskkRc3wyoA0/gLxynuGnDEZbKvyI0f60eilbtWd7yzQ+E8u4p1M3BtBkgyOg56kYUd37FtYsTD9X7y0Wnq5SiumShwpc4nxYvdoCb0QuRPl9x+mGHmRJIJH2ESo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=hhd1tzeQ; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="hhd1tzeQ"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so4690804eec.0
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 02:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792142773; cv=none;
        d=google.com; s=arc-20260327;
        b=Z3iAJ2l894XrvoX3PLrSI8GiGpHs7zJu65O22sZd2taEhSh8x/gBMJxABuW8aVTFi2
         lvmF0hSblu6mv9u/6GFMEsX/ZsQo1Cd0aXCP9oXcSJyFXpFUSAqb1RJG7xKUtrWHYa1j
         0h4lHWagNy9JUtfjeWoAV0Ex3nQIPVtuP9d/KyX5rf1jFET00B6ppEub3aLP7YNrBVrn
         tDxHBAcwwrbduJNtHVSSAQcUGxGoFLsaYBmq0XjX6I/qoriXFAsoWfD3yifH9E3ppB6S
         C8PTi7g8apLLVJsytnyL7uDf12Yimutv9wHAzq8XXL6ofQpcIJQFrMxgJ79LXG2KqFN/
         j5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HGoCw8arpCvJPsqHUcXcqUYXTcaAYS9oUg/iWN4NGJE=;
        fh=E/bCPXoU7Tww7AhaT3KPHJ5gpUpo1q09fnwZN7SpfQs=;
        b=eqbrL6Jea2Kw73c4iUtrOoD8UmaDytSqdNhdWMQiczgvkuUIOvYBxhYs4FXjg5TnHV
         M7rigpyqYE7TxbnutQokzvVwe1Wf0btm9AOIomUJZRVRAoUZB+jfeO/FyV7O9jVuXx+W
         atb9AiXi2yCWXoYBQ9+5a/bCYL5VUY5mDyHsmw0zKmz9oAiV7UzmPl2d5tuFO8zhJTwJ
         gCdgHznvID3AQ3veBqu0ZH3iXU64PrMhtY5o29bJlO2U7mjiBOlJGADipN1KfRWLxwkI
         UlVgQ/pDu88krQhO9wB3yfhdTot8lXNgen2l6ybvq34grc0EjxvgpqbOVVeB79DJ6B/5
         HpiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792142773; x=1792747573; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGoCw8arpCvJPsqHUcXcqUYXTcaAYS9oUg/iWN4NGJE=;
        b=hhd1tzeQr9JbyXWxQp72JShiVfn+8jVZ3lJO9II/SnMMURr+tK73y8T6PuMeg7VijC
         RUcqe7J3waCs3XhFY8hvUduhvy5hvvD5yiN6G49Pe0PmDLfzkBjGULlUyz9fUGsxk0PK
         iBH1Xmxoj+63w0Nau/1m9aFpz4kWC5d3I1khI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142773; x=1792747573;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HGoCw8arpCvJPsqHUcXcqUYXTcaAYS9oUg/iWN4NGJE=;
        b=ZEbde69hZdSTRhwN4J3TJSEQKfPUUagjFVAd6blpYowcpPsrglADO2wlgdbR5kndad
         cc0xzt02uNhyuZ2FXj86TeCeLnw2TSCNZz7xkevs5CM69NrBPskQUfZ0+ZKam2r0eT03
         nX2uwVjTgYFwbMPgYuK4ipWQVC7Pj21ZKE6g1wZ/G0/891CofQOvbKMx4c9ORrXfoUeI
         f7QT++1nWi5hR5i4Bgi7FCZTUtDBcPX8XqXxGny9++3mTBtisyc2s8MWoFfU7a3DVBrC
         xkXZDwm0VAG+XiK+GSTIrgFtODdB8EoTmnzkz+lQeMDpN55Cwpz4eElbzYlfbraqJaiD
         6eTg==
X-Gm-Message-State: AFq9FYKYOY5iLLEG92dWiUx1dxBtXA3wtwWHounar7+y6Dpo2O6r5g85
	0dOnUBHiDekPY4RQQwDbFmA/qQ7WLq8aKjPKJCkhe6ix8wxWhz4QeI7Q5SrQiecoY6d27L7oZ5j
	wDKIO7XcJ/fhmqNhx0am7ChYvRb9HWjep9hM1i3nqmg==
X-Gm-Gg: AYBFou2z9ebyK/E4yae45mzCNeO2tBhNazrqU3y/j77mgbgP0YA7ZPVeGBz6jOrKniz
	814Oo7V2FWf+Kcq9frnWvnFd1O7755pVvZ5siv/ZEoisG2nSfTkb3Fd1jRJIR0W/olhYUmXXbxk
	n+m04XdGdotgRPfiZ+CgAtp+lVJFnZeqhrqRzAHPYgKPHk9C4HFrhaS3JdSR7vB52FubDYFr4Eu
	9wOEdNpOw5WWwSSzgux+eO28+xkJR6QO2x+YmiS0ys5TQrnkTM5iKpjCB7tNEzc2B7gkUblOqwN
	tAOs0BieBI2Va3R+P35/Gkoes6dcxgNpPY3uV5hPA/ph2bXcWwxDhgHzX7YtgPUisXwB8nzzrnX
	Nxittuk4=
X-Received: by 2002:a05:7300:b2a0:b0:35d:a0cd:d51f with SMTP id
 5a478bee46e88-35da0cde46bmr10124814eec.23.1792142773386; Fri, 16 Oct 2026
 02:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260919221733.3707924-1-benquike@gmail.com>
In-Reply-To: <20260919221733.3707924-1-benquike@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 11:26:01 +0200
X-Gm-Features: AclHuK9BVEm1WCw4p4aCLcE6cjhyBLWI44El__CmqYM8k7kFJfihMOcJPeFeM9E
Message-ID: <CAJfpegt-XzXMkvVQZAYGc4KvL5pTFNBya5mzmLPfTGxBYBn+jA@mail.gmail.com>
Subject: Re: [PATCH] fuse: validate folio state before pipe_buf_try_steal() in fuse_try_move_folio()
To: Hui Peng <benquike@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sept 2026 at 00:17, Hui Peng <benquike@gmail.com> wrote:
>
> In fuse_try_move_folio(), check that the pipe buffer's folio is not
> hugetlb, swap-backed, or already mapped/anon before attempting
> pipe_buf_try_steal() and inserting it into the FUSE inode's page cache,
> preventing VM_BUG_ON_FOLIO() and page cache state corruption.

Applied, thanks.

Miklos

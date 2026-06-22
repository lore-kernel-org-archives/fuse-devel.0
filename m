Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB25364950
	for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 07:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113141; cv=pass; b=QO6zZ8wcf0PdAG1mSmCVglIjcRofA/NW4xgR3ykKvlHZ2QVfwSB3sn+0vAUnQGAHBy9OFRULkNLLLfUT676XcqstPyV5RxnJs3YJo41waSbGQ3fPcBAeMhIC1J70Ykz4IhzbuuyoEak8sZQWmUBCw+uvr8+8itMDyuN+j0ytgvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113141; c=relaxed/simple;
	bh=sYABkW5LwndfcYN7JURs48qve64iQdny0wl017yDXcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4GN16D/WfgEHWlf88FWWaBYPApg/otllo9qKsY1l9LHkIrEGch/ez0TCKN5Foct6uUi33xJmw12G5nWPoe3iR5C06gtY/BNQ9ebs6e3FeKy/7wV26WE3CL10hRwYnGqz5bxsYdeIpw2bC4ABsEgvNjcG03UDd/K8CBx7hcXAO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=OIXGB/RH; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="OIXGB/RH"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-519ddebce3dso33235641cf.0
        for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 00:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782113138; cv=none;
        d=google.com; s=arc-20240605;
        b=Fh5hnvHwHNhdwiB/xBe1RhKr7cs2CpRXFZ9HlXhnagQIfxrTO3tsupsS2prCoaftFu
         BuK9oIdYLeNcV+cSrUUXDGFIfZRQPJayCgVyEAPPhSWABQIVoNbw56X2v3alilCaYaWt
         dz06QnfjQJ2y/EW87SOI4IUt3+7CyStlqAYScFY5rXxCkptFeeERFdPtw+NGFVfD2L3J
         C5jyXo5m5YznN5kL3wF1w3Ip5BEokM0cMxJl3nQM6VjhRheG7B1I7EsPwHcMi3f3vMgw
         oxhySHgm0GsDezDakiG+a7wAjTLShFFU1fWziKJW/68lKEF+mf/961ZfQSUrTCjnrE4t
         FCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cB43tNrLFmhhAalRrSLxDzVdIAU1XtS0M9dqv+PXGI=;
        fh=c87DipSE4LvsuOW0AE3eW5UEr4ulfJhedkzmROltqNg=;
        b=C7G+T7iUlnSER9qVOyxPyNxnwqnZAoROuiuh44sQY/jVd5Hx65tKmNWeM4zGN404iu
         Wa2DYr9iMElqOEJ/o1maTzt4yEzavYRqGafw/+aHHWl5l4Bx90HEXaRsZLEFzlfGXmob
         DIUn3VSShWG5XM7VuQK8ot/c95fzBZ6rvjClQaIFG0Yfctf/VWwtBso3WlbMYxPgvovc
         Cf482WVmhhByrBgXpzYmu+eMY4mT8duO1b2kiOs5Sgm/D4MszhOq2w2hLN7AsXzmEq9M
         xum/7dRS6jzLoIjOZbnHn6CCGFB/KEI9tMki1QPvJ8hn/rCOEFEHkrCnuIeDVR2xEX0G
         Dxzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1782113138; x=1782717938; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3cB43tNrLFmhhAalRrSLxDzVdIAU1XtS0M9dqv+PXGI=;
        b=OIXGB/RHtgciEDYu3kDRI5azOZ5D7KOsdnKJy2YBywETP8GsFtGAJl2kVIQotyJl3/
         Xo9shjoCPOMoDffnGHuM3Nj0jQTe64ZCme2B0Gk5kAfkqHpJnEWkJuFEOJWzMQD+hoXe
         7Mfjd4AUWKJtYuiZ13mXtwV7zx4kLbgkvJhmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782113138; x=1782717938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cB43tNrLFmhhAalRrSLxDzVdIAU1XtS0M9dqv+PXGI=;
        b=Vig+QZJQMNkoup40c+upvrDkUAuL3wJ/qwUQW+JXqTsyi6mc3r+Eba86Ik1oCE2Jkt
         +8RyJOc8Ynqhiz0tYA+QW0nFeGNT0ulvkE55fWgKQCHGLRczdZecxRsPVfqnckOhBbF7
         Rgg+/sAxAtyfpvwKkWbJ2Y4U1JniKxwCYgQ3P4Rx0JPyfzkR+4VF+mR5ApS0GCUNWbrW
         bT0YbT2OmRPmEsUT6tWND2JVddhO671ogmMv1Bay7x06r2E/qMg8TQmw/Ztp2kLPzS73
         awwUHy4N8XMrV0vE+JhWGhXPpXcJa7t3ULzE20/RdLTf1kedTMXqSmITLechB2srfGpN
         TGew==
X-Forwarded-Encrypted: i=1; AFNElJ/ndMKWU556hFCqTj1hWBEWX+0T4z2M4iRv/JJOnSoTePXUSc7y6szByToLDZJuRCt0QC9rTZ8NtMMg@lists.linux.dev
X-Gm-Message-State: AOJu0YxEB0fCBLGFTbgXfupYE4sZcyMYgIydenHsX/GDDbhSm0rh9Ywl
	F05Pby27DGXbNUof7jcWXHKdNjmVDGewlKGE6G2sp05/Ih6musa70kV3qhMinwwI6YjcCwUdnFA
	5X4/cwZHgEwCXp37yTQdNM51engQPu+GDnMfhcS2oHg==
X-Gm-Gg: AfdE7cm48l3yGA2nMzfUrGEOTXfOzkQRMBZPTjbw6BSwi6F9CovSXaGeh5WmYLxDq8+
	xMEWctimcYGDT6xUZzgObTsWzeDRyPcVqZxJrk7n1pecH+kbAP3xJ/N4RnRiGXnxbQ3i+IlWCcZ
	ypjURJrDtgZFon1S1q/HEG86PMKkju6B32gYfkLtEwHy1WLErF18aSoAnu1lS7/6LOp/bicEoNE
	o7goWMRcSJjiAvOufUXxfh/ikXV6VCtRVgv0m2Oi5aPIz2Abq2wECRmeaK6e17e6LN7pIaVZlRo
	YjO+Ult2GmHWSxL0AYzOBXaro9M=
X-Received: by 2002:a05:622a:4813:b0:519:89b6:78b4 with SMTP id
 d75a77b69052e-519e4da713cmr182243931cf.40.1782113138113; Mon, 22 Jun 2026
 00:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 22 Jun 2026 09:25:26 +0200
X-Gm-Features: AVVi8Cc8mKBNLxe363b81egGdSi1ieFYi4FNQdS5IDY53ZKz2NjqthN0jVU8I6s
Message-ID: <CAJfpegvDK7aaMJHmPXxXoJs_MfHe=TBUXWoj=_yA1_m7T8OkwA@mail.gmail.com>
Subject: Re: [PATCH] fuse: replace passthrough backing-id IDR with IDA plus hashtable
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: amir73il@gmail.com, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Jun 2026 at 20:32, Mahad Ibrahim <mahad.ibrahim.dev@gmail.com> wrote:

> Replace the IDR with an IDA for id allocation and a separate hashtable for
> the id-to-pointer lookup. The IDA needs far less memory per id; the
> hashtable adds a fixed per-connection cost. The net effect is a space win
> that grows with the number of live backings, as quantified below.

But why use IDA at all?  A simple cyclic counter should be sufficient.
Collisions (which should be rare) can be avoided via hash table
lookup.

Thanks,
Miklos

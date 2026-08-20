Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B173E00A9
	for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216874; cv=none; b=IwmtU5+RozciqP+RBgEBCulrq/23+A+7YxIT3cbE06/+7tsSVhmxx5tHTT8o76fkWRMpcv8wuvzNiiTBB4CjZ1u/C09bc0GgZP4z8XlnSTXjFrySeygpYYaO2Rq3G7/1Gpf24057ceC9PbgduVET0rZgBydxyZFvmojJHnQcW30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216874; c=relaxed/simple;
	bh=X4bUaEQ1kMXJ2IGQ0N2R4Va26Sksm8adfTXPYgGoH/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwpWEuVMjhwoKVcP6FheqaF3XETOpEKZ1x0yV+IPtPO+3GSPJOwrgudBguAFl9YaIH5iNxgTedBfqzOoEqVJDy/5KyDTNSF8zZ8RYIC0TQiJGP9losBDbp1Z5XlWn4c6D5eY26Qg3lP3rvuJbFJzM55rc+Rfm7s+1ZMkX/Ww5eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Yo7QNX46; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yo7QNX46"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3900e39d935so2011066a91.0
        for <fuse-devel@lists.linux.dev>; Thu, 20 Aug 2026 02:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787216872; x=1787821672; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wl5BSRIINtWqri27Xhx5y8Z3dhvGGW8LdsZ+EJy7sAQ=;
        b=Yo7QNX46r6299O4irOVGHjn1glt1gheStZFHhbnkIqzbAbNuIO0hBzQ/m70J+NsswR
         9uwioYEJJGtEjq3Yce6JThaGxdIdr4uMwMc70sqsFiY1L0tn8i3AOSy/bhYQ7txgcCoR
         I0BQJKL2ZWuqycS96rR1uTYmMCh8rjxzP2+uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216872; x=1787821672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wl5BSRIINtWqri27Xhx5y8Z3dhvGGW8LdsZ+EJy7sAQ=;
        b=fZnSXv6AV5LWfzNaQvNlg+BBHvKI6RT3Db+ipunUG8qmP5rkTF8xJXBjmYkV0EgADG
         C9vjcJZbzhQUMTWghaUTy2Tqm/W82nHgrERuRjL/npHXD/fcOEorDDsN+rsV6A/9nNID
         6mpwOiN//ewHw6JOpVhpF4FzKIsoMdx7mfrDSt9lzNNkpf5eIJK08PlhvZY0XXy4kkLN
         cZDMKfIWEjvXP8c28rcsSt0Ua+KQc2cwwJVMRZHv+pcU+CnzHkrqQQYG/HJNcM6rRjvK
         E96hahuuMJYTLgGYW3sSxsSA7F/4SPV+t4TuR4A9kvsHXTs4ByIlE3PhuFdaLS7qwcvb
         GFRA==
X-Forwarded-Encrypted: i=1; AHgh+RpLk19kf9GU3jGwxA0O8LPzTge9JsKsYwc87CKtcbiVjWxX0z+85iOBPDGNfpvdyce9QJARu5tUDojb@lists.linux.dev
X-Gm-Message-State: AFuF++lRcldUoekD2yLBC1ghBmh7aaU7e+Ghge8ZlrZfB6boDW7aLIZd
	Hd5H8oerq8zWlRCtKxPpNYbRpX6d8MT/toCTiRwGrDEUR0iLTHiscJ9WtZGmKO5Lbw==
X-Gm-Gg: AR+sD12LcAgqlZdHqpgHq2/nXvN+qzWld3tKiHtyjqb3cZqeFc2mq8WKzWEUIjvG41H
	yBFsQQ7IZNg7D+4K/PBBzheVqatwvq07zgYEAzp3fGUWLPCjReZxsXE3W4VBzgBLn8jOVTETK4j
	iC/KUKFlpwga0WmjByhTGIV5XPc1gW3C7/HS2rNSQ3IxuxLkxV9W8wecZH4I/8HEg6yaQpEBWex
	+wk/JqTppeqmcaD2AXzSYuJMSMEyJS12tfZQoRjmfTKT4ceIEfB8H1CHNoNArQa0GYx/BWBFgbw
	YuUowWxAg4cBtCY/SAqm3m6+COEO6Pax7t3qyZQlIR4ah2OP+rrI7MdHeKrdoSqb6VZxomkEJd/
	Pq9bgCVXvVNLCzlCF6ApnhujjPwpAZkfmWh5XlLYm2Kp9qR08eXLvtl/ib9YN9LIbD1bWen0LX1
	okmRxwcF39EQ+ActQzgM5VAjd1eT6BiFZzjY9eIlWJzdlnW/a1VJNQbrXC5WFloZU52RY1+RQvT
	YF/1D3kPT8PwkNSJwd0oT7AOx+t
X-Received: by 2002:a17:90b:2792:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39581212156mr23367056a91.10.1787216871962;
        Thu, 20 Aug 2026 02:07:51 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:7beb:7701:c87e:f611])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb3069csm7198882a91.15.2026.08.20.02.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:07:22 -0700 (PDT)
Date: Thu, 20 Aug 2026 18:07:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2] fuse: permit freezing while waiting for request answer
Message-ID: <aobDGgivy43cz7xQ@google.com>
References: <20260819023542.561653-1-senozhatsky@chromium.org>
 <CAJfpegu2wOG85R6KSvCwHOuxe2fWczA1KbrFcCZz=ofUch4K=w@mail.gmail.com>
 <20260820084933.GA4036497@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820084933.GA4036497@noisy.programming.kicks-ass.net>

On (26/08/20 10:49), Peter Zijlstra wrote:
> Message-ID: <20260820084933.GA4036497@noisy.programming.kicks-ass.net>
> 
> On Wed, Aug 19, 2026 at 12:03:32PM +0200, Miklos Szeredi wrote:
> > Why is this unsafe exactly?  Does that unsafeness apply to
> > filesystems?  If so why do we allow freezing while blocked on
> > sb_start_write()?
> 
> Getting frozen with lock A held, while another task is blocked on A in
> an unfreezable state results in the system not being freezable.

Right, but then the system says "suspend failed" (tasks refuse to freeze
after 20sec) and just thaws everything back in?
